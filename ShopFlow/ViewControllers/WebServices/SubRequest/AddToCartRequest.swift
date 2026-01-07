//
//  AddToCartRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/25/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class AddToCartRequest: BaseRequest{
    
    var product_id: String?
    var color_id: String?
    var size_id: String?
    var quantity: String?
    
    override var url: String{
        return GlobalConstant.AddToCart
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["product_id"] = product_id
        params["color_id"] = color_id
        params["size_id"] = size_id
        params["quantity"] = quantity
        return params
    }
}
