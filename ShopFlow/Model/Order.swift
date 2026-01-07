//
//  Order.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/28/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class Order : NSObject, NSCoding{

    var couponAmount : String?
    var couponId : Int?
    var couponPercent : Int?
    var createdAt : String?
    var deliveryCost : Int?
    var finalTotal : String?
    var id : Int?
    var paymentMethod : String?
    var status : Int?
    var storeId : Int?
    var subTotal : Int?
    var type : String?
    var userAddressId : String?
    var userId : Int?
    var vatAmount : String?
    var vatPercent : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        couponAmount = json["coupon_amount"].stringValue
        couponId = json["coupon_id"].intValue
        couponPercent = json["coupon_percent"].intValue
        createdAt = json["created_at"].stringValue
        deliveryCost = json["delivery_cost"].intValue
        finalTotal = json["final_total"].stringValue
        id = json["id"].intValue
        paymentMethod = json["payment_method"].stringValue
        status = json["status"].intValue
        storeId = json["store_id"].intValue
        subTotal = json["sub_total"].intValue
        type = json["type"].stringValue
        userAddressId = json["user_address_id"].stringValue
        userId = json["user_id"].intValue
        vatAmount = json["vat_amount"].stringValue
        vatPercent = json["vat_percent"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if couponAmount != nil{
            dictionary["coupon_amount"] = couponAmount
        }
        if couponId != nil{
            dictionary["coupon_id"] = couponId
        }
        if couponPercent != nil{
            dictionary["coupon_percent"] = couponPercent
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if deliveryCost != nil{
            dictionary["delivery_cost"] = deliveryCost
        }
        if finalTotal != nil{
            dictionary["final_total"] = finalTotal
        }
        if id != nil{
            dictionary["id"] = id
        }
        if paymentMethod != nil{
            dictionary["payment_method"] = paymentMethod
        }
        if status != nil{
            dictionary["status"] = status
        }
        if storeId != nil{
            dictionary["store_id"] = storeId
        }
        if subTotal != nil{
            dictionary["sub_total"] = subTotal
        }
        if type != nil{
            dictionary["type"] = type
        }
        if userAddressId != nil{
            dictionary["user_address_id"] = userAddressId
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        if vatAmount != nil{
            dictionary["vat_amount"] = vatAmount
        }
        if vatPercent != nil{
            dictionary["vat_percent"] = vatPercent
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        couponAmount = aDecoder.decodeObject(forKey: "coupon_amount") as? String
        couponId = aDecoder.decodeObject(forKey: "coupon_id") as? Int
        couponPercent = aDecoder.decodeObject(forKey: "coupon_percent") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        deliveryCost = aDecoder.decodeObject(forKey: "delivery_cost") as? Int
        finalTotal = aDecoder.decodeObject(forKey: "final_total") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        paymentMethod = aDecoder.decodeObject(forKey: "payment_method") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int
        storeId = aDecoder.decodeObject(forKey: "store_id") as? Int
        subTotal = aDecoder.decodeObject(forKey: "sub_total") as? Int
        type = aDecoder.decodeObject(forKey: "type") as? String
        userAddressId = aDecoder.decodeObject(forKey: "user_address_id") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
        vatAmount = aDecoder.decodeObject(forKey: "vat_amount") as? String
        vatPercent = aDecoder.decodeObject(forKey: "vat_percent") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if couponAmount != nil{
            aCoder.encode(couponAmount, forKey: "coupon_amount")
        }
        if couponId != nil{
            aCoder.encode(couponId, forKey: "coupon_id")
        }
        if couponPercent != nil{
            aCoder.encode(couponPercent, forKey: "coupon_percent")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deliveryCost != nil{
            aCoder.encode(deliveryCost, forKey: "delivery_cost")
        }
        if finalTotal != nil{
            aCoder.encode(finalTotal, forKey: "final_total")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if paymentMethod != nil{
            aCoder.encode(paymentMethod, forKey: "payment_method")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if storeId != nil{
            aCoder.encode(storeId, forKey: "store_id")
        }
        if subTotal != nil{
            aCoder.encode(subTotal, forKey: "sub_total")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if userAddressId != nil{
            aCoder.encode(userAddressId, forKey: "user_address_id")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }
        if vatAmount != nil{
            aCoder.encode(vatAmount, forKey: "vat_amount")
        }
        if vatPercent != nil{
            aCoder.encode(vatPercent, forKey: "vat_percent")
        }

    }

}
