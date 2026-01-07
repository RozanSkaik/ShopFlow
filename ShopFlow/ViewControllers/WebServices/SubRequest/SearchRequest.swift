//
//  SearchRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/22/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class SearchRequest: BaseRequest{
    
    var text: String?
    
    override var url: String{
        return GlobalConstant.searchProducts
    }
    override var method: HTTPMethod{
        return .get
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["text"] = text
        return params
    }
}
