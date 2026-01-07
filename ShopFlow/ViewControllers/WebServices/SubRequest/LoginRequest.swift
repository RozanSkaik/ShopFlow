//
//  LoginRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class LoginRequset: BaseRequest{
    var email: String?
    var password: String?
    var name: String?
    var mobile: String?
    var code: String?
    var latitude: String = "\(UserDefaults.standard.double(forKey: "latitude"))"
    var longitude: String = "\(UserDefaults.standard.double(forKey: "longitude"))"
    var fcm_token: String = "eyeryerye"
    var device_type: String = "ios"
    var selectedImage: Data?
    var nameImage: String?
    var mimeType: String?
    
    var seletedType: UserType!
    
    init(_ type: UserType) {
        self.seletedType = type
    }
    
    enum UserType{
        case login
        case signUp
        case resetPassword
        case checkCode
        case editProfile
        case logout
    }
    
    override public var url: String {
        switch seletedType{
        case .login:
            return GlobalConstant.Login
        case .signUp:
            return GlobalConstant.SignUp
        case .resetPassword:
            return GlobalConstant.ResetPassword
        case .checkCode:
            return GlobalConstant.CheckCode
        case .editProfile:
            return GlobalConstant.editProfile
        case .logout:
            return GlobalConstant.Logout
        case .none:
            return ""
        }
        
    }
    override var method: HTTPMethod{
        switch seletedType{
        case .login:
            return .post
        case .signUp:
            return .post
        case .resetPassword:
            return .post
        case .checkCode:
            return .post
        case .editProfile:
            return .post
        case .logout:
            return .get
        case .none:
            return .post
        }
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        switch seletedType{
        case .login:
            params["email"] = email
            params["password"] = password
            params["fcm_token"] = fcm_token
            params["device_type"] = device_type
        case .signUp:
            params["name"] = name
            params["email"] = email
            params["mobile"] = mobile
            params["password"] = password
            params["fcm_token"] = fcm_token
            params["device_type"] = device_type
        case .editProfile:
            params["name"] = name
            params["email"] = email
            params["mobile"] = mobile
            params["password"] = password
            params["latitude"] = latitude
            params["longitude"] = longitude
            params["fcm_token"] = fcm_token
            params["device_type"] = device_type
        case .resetPassword:
            params["email"] = email
        case .checkCode:
            params["mobile"] = mobile
            params["code"] = code
        case .logout:
            break
        case .none:
            break
        }
        return params
        
    }
    override var images: [BaseFile]{
        var files: [BaseFile] = []
        
        let file = BaseFile()
        file.paramName = "image_profile"
        file.name = nameImage
        file.mimeType = mimeType
        if let data = selectedImage {
            file.data = data
            files.append(file)
        }
        return files
    }
}
