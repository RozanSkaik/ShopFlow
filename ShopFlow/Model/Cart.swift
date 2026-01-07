//
//  Cart.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class Cart : NSObject, NSCoding{

    var createdAt : String?
    var id : Int?
    var product : Products?
    var productId : Int?
    var quantity : Int?
    var store : ViewStores?
    var storeId : Int?
    var userId : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        let productJson = json["product"]
        if !productJson.isEmpty{
            product = Products(fromJson: productJson)
        }
        productId = json["product_id"].intValue
        quantity = json["quantity"].intValue
        let storeJson = json["store"]
        if !storeJson.isEmpty{
            store = ViewStores(fromJson: storeJson)
        }
        storeId = json["store_id"].intValue
        userId = json["user_id"].intValue
    }

    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if product != nil{
            dictionary["product"] = product?.toDictionary()
        }
        if productId != nil{
            dictionary["product_id"] = productId
        }
        if quantity != nil{
            dictionary["quantity"] = quantity
        }
        if store != nil{
            dictionary["store"] = store?.toDictionary()
        }
        if storeId != nil{
            dictionary["store_id"] = storeId
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        product = aDecoder.decodeObject(forKey: "product") as? Products
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
        quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
        store = aDecoder.decodeObject(forKey: "store") as? ViewStores
        storeId = aDecoder.decodeObject(forKey: "store_id") as? Int
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if product != nil{
            aCoder.encode(product, forKey: "product")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if quantity != nil{
            aCoder.encode(quantity, forKey: "quantity")
        }
        if store != nil{
            aCoder.encode(store, forKey: "store")
        }
        if storeId != nil{
            aCoder.encode(storeId, forKey: "store_id")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }

    }

}
