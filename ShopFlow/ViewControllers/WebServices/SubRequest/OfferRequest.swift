//
//  OfferRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class OfferRequest: BaseRequest{
    override var url: String{
        return GlobalConstant.getOffers
    }
    override var method: HTTPMethod{
        return .get
    }
}
