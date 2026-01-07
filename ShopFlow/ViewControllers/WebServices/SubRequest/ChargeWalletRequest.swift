//
//  ChargeWalletRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ChargeWalletRequest: BaseRequest{
    
    var amount: String?
    
    override var url: String{
        return GlobalConstant.chargeWallet
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["amount"] = amount
        return params
    }
}
