//
//  SearchOfferRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 10/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class SearchOfferRequest: BaseRequest{
    
    var text: String?
    
    override var url: String{
        return GlobalConstant.searchOffers
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
