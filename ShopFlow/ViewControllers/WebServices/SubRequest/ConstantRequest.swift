//
//  ConstantRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/14/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ConstantsRequest: BaseRequest{
    
    override var url: String{
        return GlobalConstant.Constants
    }
    override var method: HTTPMethod{
        return .get
    }
}
