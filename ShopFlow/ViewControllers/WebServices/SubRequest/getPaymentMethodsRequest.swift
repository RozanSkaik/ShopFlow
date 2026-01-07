//
//  getPaymentMethodsRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class getPaymentMethodsRequest: BaseRequest{
        
    override var url: String{
        return GlobalConstant.getPaymentMethods
    }
    override var method: HTTPMethod{
        return .get
    }
}
