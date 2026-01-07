//
//  getMyAddressesRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/23/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class AddressRequest: BaseRequest{
    
    var latitude: String?
    var longitude: String?
    var address: String?
    var address_id: String?
    
    var seletedType: AddressType!
    
    init(_ type: AddressType) {
        self.seletedType = type
    }
    
    enum AddressType{
        case getAddress
        case addAddress
        case editAddress
        case deleteAddress
    }
    
    override var url: String{
        switch self.seletedType{
        case .getAddress:
            return GlobalConstant.getMyAddresses
        case .addAddress:
            return GlobalConstant.addNewAddress
        case .editAddress:
            return GlobalConstant.editMyAddress
        case .deleteAddress:
            return GlobalConstant.deleteAddress
        case .none:
            return ""
        }
    }
    override var method: HTTPMethod{
        switch self.seletedType{
        case .getAddress:
            return .get
        case .addAddress:
            return .post
        case .editAddress:
            return .post
        case .deleteAddress:
            return .get
        case .none:
            return .get
        }
        
    }
    override var parameters: [String : Any]{
        var params: [String:Any] = [:]
        switch seletedType{
        case .getAddress:
            break
        case .addAddress:
            params["latitude"] = latitude
            params["longitude"] = longitude
            params["address"] = address
            break
        case .editAddress:
            params["address_id"] = address_id
            params["latitude"] = latitude
            params["longitude"] = longitude
            params["address"] = address
            break
        case .deleteAddress:
            params["address_id"] = address_id
        case .none:
            break
        }
        return params
    }
}
