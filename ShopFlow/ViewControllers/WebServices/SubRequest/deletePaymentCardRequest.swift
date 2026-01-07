//
//  deletePaymentCardRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class DeletePaymentCardRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.deletePaymentCard
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["card_id"] = id
        return params
    }
}
