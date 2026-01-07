//
//  ProductDetailsRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ProductDetailsRequest: BaseRequest{
    
    var productId: Int?
    
    override var url: String{
        return GlobalConstant.productDetails + "\(productId ?? 0)"
    }
    override var method: HTTPMethod{
        return .get
    }
}
