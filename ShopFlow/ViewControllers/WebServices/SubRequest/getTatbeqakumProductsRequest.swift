//
//  getShopFlowProductsRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ShopFlowStoreRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.viewShopFlowProducts + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
