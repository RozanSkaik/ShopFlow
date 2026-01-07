//
//  MyOrdersRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/29/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class MyOrdersRequest: BaseRequest{
        
    override var url: String{
        return GlobalConstant.getClientOrders
    }
    override var method: HTTPMethod{
        return .get
    }
}
class ClientOrderDetailsRequest: BaseRequest{
    
    var id: Int?
    
    override var url: String{
        return GlobalConstant.getClientOrderDetails + "\(id ?? 0)"
    }
    override var method: HTTPMethod{
        return .get
    }
}
class CancelOrderRequest: BaseRequest{
    
    var id: Int?
    
    override var url: String{
        return GlobalConstant.clientCancelOrder + "\(id ?? 0)"
    }
    override var method: HTTPMethod{
        return .get
    }
}
