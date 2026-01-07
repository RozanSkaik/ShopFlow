//
//  ChangeNotifiStatusRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/5/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class ChangeNotifiStatusRequest: BaseRequest{
    
    var status: Int?
    var notification: String?
    
    override var url: String{
        return GlobalConstant.changeNotifiStatus + "\(status ?? 0)" + "&notification=" + (notification ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
