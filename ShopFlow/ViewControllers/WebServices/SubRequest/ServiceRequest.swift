//
//  ServiceRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ServiceRequest: BaseRequest{
    
    var details: String?
    var ordered_date: String?
    var from_latitude: String?
    var from_longitude: String?
    var to_latitude: String?
    var to_longitude: String?
    var request_service_cost: String?
    
    override var url: String{
        return GlobalConstant.requestService
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["details"] = details
        params["ordered_date"] = ordered_date
        params["from_latitude"] = from_latitude
        params["from_longitude"] = from_longitude
        params["to_latitude"] = to_latitude
        params["to_longitude"] = to_longitude
        params["request_service_cost"] = request_service_cost
        return params
    }
}
