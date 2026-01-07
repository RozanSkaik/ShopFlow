//
//  Copouns.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class Copouns : NSObject, NSCoding{

    var createdAt : String?
    var descriptionField : String?
    var discount : Int?
    var end : String?
    var id : Int?
    var name : String?
    var start : String?
    var status : String?
    var storeId : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"].stringValue
        descriptionField = json["description"].stringValue
        discount = json["discount"].intValue
        end = json["end"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        start = json["start"].stringValue
        status = json["status"].stringValue
        storeId = json["store_id"].intValue
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
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if discount != nil{
            dictionary["discount"] = discount
        }
        if end != nil{
            dictionary["end"] = end
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if start != nil{
            dictionary["start"] = start
        }
        if status != nil{
            dictionary["status"] = status
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
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        discount = aDecoder.decodeObject(forKey: "discount") as? Int
        end = aDecoder.decodeObject(forKey: "end") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        start = aDecoder.decodeObject(forKey: "start") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        storeId = aDecoder.decodeObject(forKey: "store_id") as? Int
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
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if discount != nil{
            aCoder.encode(discount, forKey: "discount")
        }
        if end != nil{
            aCoder.encode(end, forKey: "end")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if start != nil{
            aCoder.encode(start, forKey: "start")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if storeId != nil{
            aCoder.encode(storeId, forKey: "store_id")
        }

    }

}
