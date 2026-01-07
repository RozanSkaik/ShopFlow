//
//  DeleteCartRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class DeleteCartRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.DeleteCart + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
