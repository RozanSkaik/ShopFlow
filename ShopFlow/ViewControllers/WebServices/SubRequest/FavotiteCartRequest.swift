//
//  FavotiteCartRequest.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Alamofire

class FavoriteCartRequest: BaseRequest{
        
    override var url: String{
        return GlobalConstant.ShowFavorite
    }
    override var method: HTTPMethod{
        return .get
    }
}

class AddFavoriteCartRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.FavoriteCart + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
class DeleteFavoriteCartRequest: BaseRequest{
    
    var id: String?
    
    override var url: String{
        return GlobalConstant.DeleteFavoriteCart + (id ?? "")
    }
    override var method: HTTPMethod{
        return .get
    }
}
