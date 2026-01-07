//
//  ChangeQuantityRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ChangeQuantityRequest: BaseRequest{
    
    var product_id: String?
    var type: String?
    
    override var url: String{
        return GlobalConstant.changeQuantity
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["product_id"] = product_id
        params["type"] = type
        return params
    }
}
