//
//  AddNewCouponRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class AddNewCopounsRequest: BaseRequest{
    
    var coupon: String?
    
    override var url: String{
        return GlobalConstant.addNewCoupon
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["coupon"] = coupon
        return params
    }
}
