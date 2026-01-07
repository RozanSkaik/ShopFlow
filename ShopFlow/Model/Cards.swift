//
//  Cards.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON

class Cards : NSObject, NSCoding{

    var cardNumber : String?
    var createdAt : String?
    var deletedAt : String?
    var expiredDate : String?
    var id : Int?
    var method : Method?
    var methodId : Int?
    var nameCardholder : String?
    var updatedAt : String?
    var userId : Int?
    var validationNumber : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        cardNumber = json["card_number"].stringValue
        createdAt = json["created_at"].stringValue
        deletedAt = json["deleted_at"].stringValue
        expiredDate = json["expired_date"].stringValue
        id = json["id"].intValue
        let methodJson = json["method"]
        if !methodJson.isEmpty{
            method = Method(fromJson: methodJson)
        }
        methodId = json["method_id"].intValue
        nameCardholder = json["name_cardholder"].stringValue
        updatedAt = json["updated_at"].stringValue
        userId = json["user_id"].intValue
        validationNumber = json["validation_number"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if cardNumber != nil{
            dictionary["card_number"] = cardNumber
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if deletedAt != nil{
            dictionary["deleted_at"] = deletedAt
        }
        if expiredDate != nil{
            dictionary["expired_date"] = expiredDate
        }
        if id != nil{
            dictionary["id"] = id
        }
        if method != nil{
            dictionary["method"] = method?.toDictionary()
        }
        if methodId != nil{
            dictionary["method_id"] = methodId
        }
        if nameCardholder != nil{
            dictionary["name_cardholder"] = nameCardholder
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if validationNumber != nil{
            dictionary["validation_number"] = validationNumber
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        cardNumber = aDecoder.decodeObject(forKey: "card_number") as? String
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? String
        expiredDate = aDecoder.decodeObject(forKey: "expired_date") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        method = aDecoder.decodeObject(forKey: "method") as? Method
        methodId = aDecoder.decodeObject(forKey: "method_id") as? Int
        nameCardholder = aDecoder.decodeObject(forKey: "name_cardholder") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
        validationNumber = aDecoder.decodeObject(forKey: "validation_number") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if cardNumber != nil{
            aCoder.encode(cardNumber, forKey: "card_number")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deleted_at")
        }
        if expiredDate != nil{
            aCoder.encode(expiredDate, forKey: "expired_date")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if method != nil{
            aCoder.encode(method, forKey: "method")
        }
        if methodId != nil{
            aCoder.encode(methodId, forKey: "method_id")
        }
        if nameCardholder != nil{
            aCoder.encode(nameCardholder, forKey: "name_cardholder")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if validationNumber != nil{
            aCoder.encode(validationNumber, forKey: "validation_number")
        }

    }

}
class Method : NSObject, NSCoding{

    var createdAt : String?
    var id : Int?
    var image : String?
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
        image = json["image"].stringValue
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
        if image != nil{
            dictionary["image"] = image
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
        image = aDecoder.decodeObject(forKey: "image") as? String
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
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }

    }

}
