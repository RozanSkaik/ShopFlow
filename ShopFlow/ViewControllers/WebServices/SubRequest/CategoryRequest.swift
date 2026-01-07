//
//  CategoryRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/21/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class CategoryRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.getCategories + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
