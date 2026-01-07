//
//  NearbyStoresRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class NearbyStoresRequest: BaseRequest{
    
    var latitude: Double?
    var longitude: Double?
    
    override var url: String{
        return GlobalConstant.nearbyStores + "\(latitude ?? 0.0)" + "&longitude=" + "\(longitude ?? 0.0)"
    }
    override var method: HTTPMethod{
        return .get
    }
  
}

