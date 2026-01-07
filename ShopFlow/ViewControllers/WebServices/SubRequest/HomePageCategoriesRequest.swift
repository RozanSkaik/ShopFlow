//
//  HomePageCategoriesRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class HomePageCategoriesRequest: BaseRequest{
    override var url: String{
        return GlobalConstant.HomePageCategories
    }
    override var method: HTTPMethod{
        return .get
    }
}

