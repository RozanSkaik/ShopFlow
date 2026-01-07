//
//  Products.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/25/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class Products : NSObject, NSCoding{

    var category : ConstantsCategory?
    var categoryId : Int?
    var colors : [Color]?
    var descriptionField : String?
    var hasColors : Int?
    var hasSizes : Int?
    var id : Int?
    var image : String?
    var inCart : Int?
    var isFavorite : Int?
    var name : String?
    var offerPrice : Int?
    var otherImages : [OtherImage]?
    var price : Int?
    var rate : Int?
    var sizes : [Color]?
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
        colors = [Color]()
        var colorsArray = json["colors"].arrayValue
        for colorsJson in colorsArray{
            let value = Color(fromJson: colorsJson)
            colors?.append(value)
        }
        descriptionField = json["description"].stringValue
        hasColors = json["has_colors"].intValue
        hasSizes = json["has_sizes"].intValue
        id = json["id"].intValue
        image = json["image"].stringValue
        inCart = json["in_cart"].intValue
        isFavorite = json["is_favorite"].intValue
        name = json["name"].stringValue
        offerPrice = json["offer_price"].intValue
        otherImages = [OtherImage]()
        let otherImagesArray = json["other_images"].arrayValue
        for otherImagesJson in otherImagesArray{
            let value = OtherImage(fromJson: otherImagesJson)
            otherImages?.append(value)
        }
        price = json["price"].intValue
        rate = json["rate"].intValue
        sizes = [Color]()
        let sizesArray = json["sizes"].arrayValue
        for sizesJson in sizesArray{
            let value = Color(fromJson: sizesJson)
            sizes?.append(value)
        }
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
        if colors != nil{
        var dictionaryElements = [[String:Any]]()
        for colorsElement in (colors ?? []) {
            dictionaryElements.append(colorsElement.toDictionary())
        }
        dictionary["colors"] = dictionaryElements
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if hasColors != nil{
            dictionary["has_colors"] = hasColors
        }
        if hasSizes != nil{
            dictionary["has_sizes"] = hasSizes
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
        if otherImages != nil{
        var dictionaryElements = [[String:Any]]()
        for otherImagesElement in otherImages ?? [] {
            dictionaryElements.append(otherImagesElement.toDictionary())
        }
        dictionary["otherImages"] = dictionaryElements
        }
        if price != nil{
            dictionary["price"] = price
        }
        if rate != nil{
            dictionary["rate"] = rate
        }
        if sizes != nil{
        var dictionaryElements = [[String:Any]]()
        for sizesElement in sizes ?? []{
            dictionaryElements.append(sizesElement.toDictionary())
        }
        dictionary["sizes"] = dictionaryElements
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
        colors = aDecoder.decodeObject(forKey: "colors") as? [Color]
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        hasColors = aDecoder.decodeObject(forKey: "has_colors") as? Int
        hasSizes = aDecoder.decodeObject(forKey: "has_sizes") as? Int
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        inCart = aDecoder.decodeObject(forKey: "in_cart") as? Int
        isFavorite = aDecoder.decodeObject(forKey: "is_favorite") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        offerPrice = aDecoder.decodeObject(forKey: "offer_price") as? Int
        otherImages = aDecoder.decodeObject(forKey: "other_images") as? [OtherImage]
        price = aDecoder.decodeObject(forKey: "price") as? Int
        rate = aDecoder.decodeObject(forKey: "rate") as? Int
        sizes = aDecoder.decodeObject(forKey: "sizes") as? [Color]
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
        if colors != nil{
            aCoder.encode(colors, forKey: "colors")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if hasColors != nil{
            aCoder.encode(hasColors, forKey: "has_colors")
        }
        if hasSizes != nil{
            aCoder.encode(hasSizes, forKey: "has_sizes")
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
        if otherImages != nil{
            aCoder.encode(otherImages, forKey: "other_images")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if sizes != nil{
            aCoder.encode(sizes, forKey: "sizes")
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
class OtherImage : NSObject, NSCoding{

    var id : Int?
    var image : String?
    var productId : Int?
    var status : String?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        id = json["id"].intValue
        image = json["image"].stringValue
        productId = json["product_id"].intValue
        status = json["status"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if productId != nil{
            dictionary["product_id"] = productId
        }
        if status != nil{
            dictionary["status"] = status
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
        status = aDecoder.decodeObject(forKey: "status") as? String
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if productId != nil{
            aCoder.encode(productId, forKey: "product_id")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }

    }

}
class Color : NSObject, NSCoding{

    var createdAt : String?
    var id : Int?
    var name : String?
    var status : String?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        status = json["status"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if status != nil{
            dictionary["status"] = status
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
        name = aDecoder.decodeObject(forKey: "name") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
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
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }

    }

}
