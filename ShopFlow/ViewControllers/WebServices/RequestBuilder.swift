//
//  RequestBuilder.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class RequestBuilder {
    static let shared = RequestBuilder()
        
    static var headers: HTTPHeaders {
        var dic: HTTPHeaders = [:]
        dic["Authorization"] = "Bearer \(UserProfile.shared.accessToken)"
        dic["Accept"] = "application/json"
        dic["Accept-Language"] = "ar"
        return dic
    }
    
     var parentViewController: UIViewController? {
        
        var parentResponder: UIResponder? = AppDelegate.shared.rootNavigationViewController
        while parentResponder != nil {
           // parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    class func request(request: BaseRequest, showLoader: Bool = true, success: @escaping ((_ obj: Response) -> Void), failure: @escaping ((_ error: Error) -> Void)) {
        guard let url = URL.init(string: "\(request.url)") else { return }
        if showLoader {
            self.showLoader(isShowLoader: true)
        }
        if request.files.count > 0 || request.images.count > 0 {
            AF.upload(multipartFormData: { (multi) in
                for item in request.files {
                    if let data = item.data {
                        multi.append(data, withName: item.paramName, fileName: item.name, mimeType: item.mimeType)
                    }
                }
                for item in request.images {
                    if let data = item.data {
                        multi.append(data, withName: item.paramName , fileName: item.name, mimeType: item.mimeType)
                    }
                }
                for (key, value) in request.parameters {
                    if (value as AnyObject).isEmpty == false {
                        if let data = (value as AnyObject).data(using: String.Encoding.utf8.rawValue) {
                            multi.append(data, withName: key)
                        }
                    } else if value is String || value is Int || value is Double || value is Bool {
                        if let data = "\(value)".data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) {
                            multi.append(data, withName: key)
                        }
                    }
                }
                
            }, to: url, method: request.method, headers: self.headers, interceptor: nil).uploadProgress { (progress) in
                self.showLoader(inProgress: progress.fractionCompleted)
            }.responseData { response in
                
                ResponseHandler.responseHandler(response: response, showLoader: showLoader, request: request, url: url, success: success, failure: failure)
            }
        } else {
            AF.request(url, method: request.method, parameters: request.parameters, headers: self.headers, interceptor: nil).validate(contentType: ["application/json; charset=utf-8"]).responseData { (response) in
                ResponseHandler.responseHandler(response: response, showLoader: showLoader, request: request, url: url, success: success, failure: failure)
            }
        }
    }
    
    class func requestWithSuccessfullRespnose(request: BaseRequest, showLoader: Bool = true, showErrorMessage: Bool = true, success: @escaping ((_ obj: Response) -> Void)) {
        self.request(request: request, showLoader: showLoader, success: { (obj) in
            success(obj)
        }) { (error) in
            if showErrorMessage {
                RequestBuilder.shared.parentViewController?.showAlertError(message: error.localizedDescription)
            }
        }
    }
    
    class func showLoader(isShowLoader: Bool) {
        if isShowLoader {
            SVProgressHUD.setDefaultMaskType(.custom)
            SVProgressHUD.setForegroundColor(UIColor.hexColor(hex: "24A29B"))
            SVProgressHUD.setBackgroundColor(UIColor.white)
            SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width / 2, vertical: UIScreen.main.bounds.height / 2))
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
    class func showLoader(inProgress: Double) {
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setForegroundColor(UIColor.hexColor(hex: "24A29B"))
        SVProgressHUD.setOffsetFromCenter(UIOffset(horizontal: UIScreen.main.bounds.width / 2, vertical: UIScreen.main.bounds.height / 2))
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.showProgress(Float(inProgress))
    }
}

