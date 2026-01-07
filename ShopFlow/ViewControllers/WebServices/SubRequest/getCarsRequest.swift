//
//  getCarsRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/31/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class getCarsRequest: BaseRequest{
    override var url: String{
        return GlobalConstant.getCar
    }
    override var method: HTTPMethod{
        return .get
    }
}

