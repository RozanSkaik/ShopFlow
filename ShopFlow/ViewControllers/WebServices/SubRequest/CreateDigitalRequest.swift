//
//  CreateDigitalRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/5/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class CreateDigitalRequest: BaseRequest{
    var digital_id: String?
    var name: String?
    var email: String?
    var mobile: String?
    var priority: String?
    var details: String?
    var date_from: String?
    var date_to: String?
    var order_images: String?
    var order_files: String?
    var selectedFile: Data?
    var selectedImage: Data?
    var namefile: String?
    var nameImage: String?
    var mimeType: String?
    
    override var url: String{
        return GlobalConstant.requestDigitalService
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["digital_id"] = digital_id
        params["name"] = name
        params["email"] = email
        params["mobile"] = mobile
        params["priority"] = priority
        params["details"] = details
        params["date_from"] = date_from
        params["date_to"] = date_to
        return params
    }
    override var images: [BaseFile]{
        var files: [BaseFile] = []
        
        let file = BaseFile()
        file.paramName = "order_images[0]"
        file.name = nameImage
        file.mimeType = mimeType
        if let data = selectedImage {
            file.data = data
            files.append(file)
        }
        return files
    }
    
    override var  files: [BaseFile]{
        var files: [BaseFile] = []
        
        let file = BaseFile()
        file.paramName = "order_files[0]"
        file.name = namefile
        file.mimeType = mimeType
        if let data = selectedFile {
            file.data = data
            files.append(file)
        }
        return files
    }
}
