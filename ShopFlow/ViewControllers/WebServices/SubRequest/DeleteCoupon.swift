//
//  DeleteCoupon.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class DeleteCopounsRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.deleteCoupon + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
