//
//  GetMyCouponsRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class getMyCopounsRequest: BaseRequest{
        
    override var url: String{
        return GlobalConstant.getMyCoupons
    }
    override var method: HTTPMethod{
        return .post
    }
}
