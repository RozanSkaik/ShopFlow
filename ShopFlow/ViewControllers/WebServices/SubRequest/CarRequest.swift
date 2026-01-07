//
//  CarRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/31/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class CarRequest: BaseRequest{
    
    var car_id: String?
    var details: String?
    var from_latitude: String?
    var from_longitude: String?
    var to_latitude: String?
    var to_longitude: String?
    var request_car_cost: String?
    
    override var url: String{
        return GlobalConstant.requestCar
    }
    override var method: HTTPMethod{
        return .post
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        params["car_id"] = car_id
        params["details"] = details
        params["from_latitude"] = from_latitude
        params["from_longitude"] = from_longitude
        params["to_latitude"] = to_latitude
        params["to_longitude"] = to_longitude
        params["request_car_cost"] = request_car_cost
        return params
    }
}
