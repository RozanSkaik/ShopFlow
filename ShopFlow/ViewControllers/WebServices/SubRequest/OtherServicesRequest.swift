//
//  OtherServicesRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/5/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class OtherServicesRequest: BaseRequest{
    override var url: String{
        return GlobalConstant.getOtherServices
    }
    override var method: HTTPMethod{
        return .get
    }
}
