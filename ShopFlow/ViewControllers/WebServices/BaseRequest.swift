//
//  BaseRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class BaseRequest{

    var url: String {GlobalConstant.APIV}
    
    var parameters: [String : Any] {[:]}
        
    var method: HTTPMethod {.get}
    
    var files: [BaseFile]  {[]}
    
    var images: [BaseFile] {[]}
}
