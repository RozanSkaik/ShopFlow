//
//  ViewStoresRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/14/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ViewStoresRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.ViewStoresById + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
