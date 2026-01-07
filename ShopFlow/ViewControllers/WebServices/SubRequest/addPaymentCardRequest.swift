//
//  addPaymentCardRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class addPaymentCardRequest: BaseRequest{
    
    var method_id: String?
    var card_number: String?
    var expired_date: String?
    var validation_number: String?
    var name_cardholder: String?
    
    override var url: String{
        return GlobalConstant.addPaymentCard
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["method_id"] = method_id
        params["card_number"] = card_number
        params["expired_date"] = expired_date
        params["validation_number"] = validation_number
        params["name_cardholder"] = name_cardholder
        return params
    }
}
