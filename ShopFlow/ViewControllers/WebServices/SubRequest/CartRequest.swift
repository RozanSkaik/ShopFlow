//
//  CartRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class CartRequest: BaseRequest{
    
    var coupon: String?
    var delivery_method: Int?
    var user_address_id: Int?
    var payment_method: String?

    override var url: String{
        return GlobalConstant.MyCart
    }
    override var method: HTTPMethod{
        return .get
    }
    override var parameters: [String : Any]{
        var params: [String: Any] = [:]
        params["coupon"] = coupon
        params["delivery_method"] = delivery_method
        params["user_address_id"] = user_address_id
        params["payment_method"] = payment_method
        return params
    }
}
class CheckOutRequest: BaseRequest{
    
    var coupon: String?
    var delivery_method: Int?
    var user_address_id: Int?
    var payment_method: String?

    override var url: String{
        return GlobalConstant.checkout
    }
    override var method: HTTPMethod{
        return .get
    }
    override var parameters: [String : Any]{
        var params: [String: Any] = [:]
        params["coupon"] = coupon
        params["delivery_method"] = delivery_method
        params["user_address_id"] = user_address_id
        params["payment_method"] = payment_method
        return params
    }
}
