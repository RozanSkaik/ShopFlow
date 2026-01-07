//
//  OtherServiceRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class CreateOtherServiceRequest: BaseRequest{
    
    var other_service_id: String?
    var details: String?
    var ordered_date: String?
    var from_latitude: String?
    var from_longitude: String?
    var to_latitude: String?
    var to_longitude: String?
    var other_service_cost: String?
    
    override var url: String{
        return GlobalConstant.requestOtherService
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["other_service_id"] = other_service_id
        params["details"] = details
        params["ordered_date"] = ordered_date
        params["from_latitude"] = from_latitude
        params["from_longitude"] = from_longitude
        params["to_latitude"] = to_latitude
        params["to_longitude"] = to_longitude
        params["other_service_cost"] = other_service_cost
        return params
    }
}
