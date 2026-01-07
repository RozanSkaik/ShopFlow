//
//  ProductRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/25/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ViewStoreProductsRequest: BaseRequest{
    
    var store_id: String?
    var category_id: String?
    
    override var url: String{
        return GlobalConstant.ViewStoreProductsById + (store_id ?? "") + "&category_id=" + (category_id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
