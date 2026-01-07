//
//  Offer.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/14/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON

class Offer : NSObject, NSCoding{

    var category : ConstantsCategory?
    var categoryId : Int?
    var deliveryCost : Int?
    var descriptionField : String?
    var id : Int?
    var image : String?
    var inCart : Int?
    var isFavorite : Int?
    var name : String?
    var offerPrice : Int?
    var price : Int?
    var rate : Int?
    var status : String?
    var store : ViewStores?
    var storeId : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let categoryJson = json["category"]
        if !categoryJson.isEmpty{
            category = ConstantsCategory(fromJson: categoryJson)
        }
        categoryId = json["category_id"].intValue
        deliveryCost = json["delivery_cost"].intValue
        descriptionField = json["description"].stringValue
        id = json["id"].intValue
        image = json["image"].stringValue
        inCart = json["in_cart"].intValue
        isFavorite = json["is_favorite"].intValue
        name = json["name"].stringValue
        offerPrice = json["offer_price"].intValue
        price = json["price"].intValue
        rate = json["rate"].intValue
        status = json["status"].stringValue
        let storeJson = json["store"]
        if !storeJson.isEmpty{
            store = ViewStores(fromJson: storeJson)
        }
        storeId = json["store_id"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if category != nil{
            dictionary["category"] = category?.toDictionary()
        }
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if deliveryCost != nil{
            dictionary["delivery_cost"] = deliveryCost
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if inCart != nil{
            dictionary["in_cart"] = inCart
        }
        if isFavorite != nil{
            dictionary["is_favorite"] = isFavorite
        }
        if name != nil{
            dictionary["name"] = name
        }
        if offerPrice != nil{
            dictionary["offer_price"] = offerPrice
        }
        if price != nil{
            dictionary["price"] = price
        }
        if rate != nil{
            dictionary["rate"] = rate
        }
        if status != nil{
            dictionary["status"] = status
        }
        if store != nil{
            dictionary["store"] = store?.toDictionary()
        }
        if storeId != nil{
            dictionary["store_id"] = storeId
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        category = aDecoder.decodeObject(forKey: "category") as? ConstantsCategory
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
        deliveryCost = aDecoder.decodeObject(forKey: "delivery_cost") as? Int
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        inCart = aDecoder.decodeObject(forKey: "in_cart") as? Int
        isFavorite = aDecoder.decodeObject(forKey: "is_favorite") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        offerPrice = aDecoder.decodeObject(forKey: "offer_price") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? Int
        rate = aDecoder.decodeObject(forKey: "rate") as? Int
        status = aDecoder.decodeObject(forKey: "status") as? String
        store = aDecoder.decodeObject(forKey: "store") as? ViewStores
        storeId = aDecoder.decodeObject(forKey: "store_id") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if deliveryCost != nil{
            aCoder.encode(deliveryCost, forKey: "delivery_cost")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if inCart != nil{
            aCoder.encode(inCart, forKey: "in_cart")
        }
        if isFavorite != nil{
            aCoder.encode(isFavorite, forKey: "is_favorite")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if offerPrice != nil{
            aCoder.encode(offerPrice, forKey: "offer_price")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if store != nil{
            aCoder.encode(store, forKey: "store")
        }
        if storeId != nil{
            aCoder.encode(storeId, forKey: "store_id")
        }

    }

}
