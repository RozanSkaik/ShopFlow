//
//  User.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class User : NSObject, NSCoding{

    var accessToken : String?
    var activity : String?
    var activityId : Int?
    var address : String?
    var available : Int?
    var bio : String?
    var carLicense : String?
    var carsCount : Int?
    var city : String?
    var cityId : Int?
    var country : String?
    var countryId : Int?
    var createdAt : String?
    var discountPercent : Float?
    var email : String?
    var id : Int?
    var imageProfile : String?
    var images : [AnyObject]?
    var latitude : Float?
    var longitude : Float?
    var mobile : String?
    var name : String?
    var open : Int?
    var ownerIdCard : String?
    var providerIdCard : String?
    var providerLicense : String?
    var rate : Int?
    var rememberToken : String?
    var reviews : [AnyObject]?
    var status : String?
    var timeFrom : String?
    var timeTo : String?
    var type : Int?
    var userCategories : [AnyObject]?
    var paymentCardsCount : Int?
    var walletAmount : Int?
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        accessToken = json["access_token"].stringValue
        activity = json["activity"].stringValue
        activityId = json["activity_id"].intValue
        address = json["address"].stringValue
        available = json["available"].intValue
        bio = json["bio"].stringValue
        carLicense = json["car_license"].stringValue
        carsCount = json["cars_count"].intValue
        city = json["city"].stringValue
        cityId = json["city_id"].intValue
        country = json["country"].stringValue
        countryId = json["country_id"].intValue
        createdAt = json["created_at"].stringValue
        discountPercent = json["discount_percent"].floatValue
        email = json["email"].stringValue
        id = json["id"].intValue
        imageProfile = json["image_profile"].stringValue
//        images = [Int]()
//        let imagesArray = json["images"].arrayValue
//        for imagesJson in imagesArray{
//            images.append(imagesJson)
//        }
        latitude = json["latitude"].floatValue
        longitude = json["longitude"].floatValue
        mobile = json["mobile"].stringValue
        name = json["name"].stringValue
        open = json["open"].intValue
        ownerIdCard = json["owner_id_card"].stringValue
        providerIdCard = json["provider_id_card"].stringValue
        providerLicense = json["provider_license"].stringValue
        rate = json["rate"].intValue
        rememberToken = json["remember_token"].stringValue
//        reviews = [Int]()
//        let reviewsArray = json["reviews"].arrayValue
//        for reviewsJson in reviewsArray{
//            reviews.append(reviewsJson.)
//        }
        status = json["status"].stringValue
        timeFrom = json["time_from"].stringValue
        timeTo = json["time_to"].stringValue
        type = json["type"].intValue
//        userCategories = [Int]()
//        let userCategoriesArray = json["user_categories"].arrayValue
//        for userCategoriesJson in userCategoriesArray{
//            userCategories.append(userCategoriesJson.)
//        }
        paymentCardsCount = json["payment_cards_count"].intValue
        walletAmount = json["wallet_amount"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if accessToken != nil{
            dictionary["access_token"] = accessToken
        }
        if activity != nil{
            dictionary["activity"] = activity
        }
        if activityId != nil{
            dictionary["activity_id"] = activityId
        }
        if address != nil{
            dictionary["address"] = address
        }
        if available != nil{
            dictionary["available"] = available
        }
        if bio != nil{
            dictionary["bio"] = bio
        }
        if carLicense != nil{
            dictionary["car_license"] = carLicense
        }
        if carsCount != nil{
            dictionary["cars_count"] = carsCount
        }
        if city != nil{
            dictionary["city"] = city
        }
        if cityId != nil{
            dictionary["city_id"] = cityId
        }
        if country != nil{
            dictionary["country"] = country
        }
        if countryId != nil{
            dictionary["country_id"] = countryId
        }
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if discountPercent != nil{
            dictionary["discount_percent"] = discountPercent
        }
        if email != nil{
            dictionary["email"] = email
        }
        if id != nil{
            dictionary["id"] = id
        }
        if imageProfile != nil{
            dictionary["image_profile"] = imageProfile
        }
        if images != nil{
            dictionary["images"] = images
        }
        if latitude != nil{
            dictionary["latitude"] = latitude
        }
        if longitude != nil{
            dictionary["longitude"] = longitude
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if name != nil{
            dictionary["name"] = name
        }
        if open != nil{
            dictionary["open"] = open
        }
        if ownerIdCard != nil{
            dictionary["owner_id_card"] = ownerIdCard
        }
        if providerIdCard != nil{
            dictionary["provider_id_card"] = providerIdCard
        }
        if providerLicense != nil{
            dictionary["provider_license"] = providerLicense
        }
        if rate != nil{
            dictionary["rate"] = rate
        }
        if rememberToken != nil{
            dictionary["remember_token"] = rememberToken
        }
        if reviews != nil{
            dictionary["reviews"] = reviews
        }
        if status != nil{
            dictionary["status"] = status
        }
        if timeFrom != nil{
            dictionary["time_from"] = timeFrom
        }
        if timeTo != nil{
            dictionary["time_to"] = timeTo
        }
        if type != nil{
            dictionary["type"] = type
        }
        if userCategories != nil{
            dictionary["user_categories"] = userCategories
        }
        if paymentCardsCount != nil{
            dictionary["payment_cards_count"] = paymentCardsCount
        }
        if walletAmount != nil{
            dictionary["wallet_amount"] = walletAmount
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        accessToken = aDecoder.decodeObject(forKey: "access_token") as? String
        activity = aDecoder.decodeObject(forKey: "activity") as? String
        activityId = aDecoder.decodeObject(forKey: "activity_id") as? Int
        address = aDecoder.decodeObject(forKey: "address") as? String
        available = aDecoder.decodeObject(forKey: "available") as? Int
        bio = aDecoder.decodeObject(forKey: "bio") as? String
        carLicense = aDecoder.decodeObject(forKey: "car_license") as? String
        carsCount = aDecoder.decodeObject(forKey: "cars_count") as? Int
        city = aDecoder.decodeObject(forKey: "city") as? String
        cityId = aDecoder.decodeObject(forKey: "city_id") as? Int
        country = aDecoder.decodeObject(forKey: "country") as? String
        countryId = aDecoder.decodeObject(forKey: "country_id") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        discountPercent = aDecoder.decodeObject(forKey: "discount_percent") as? Float
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        imageProfile = aDecoder.decodeObject(forKey: "image_profile") as? String
        images = aDecoder.decodeObject(forKey: "images") as? [AnyObject]
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Float
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Float
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        open = aDecoder.decodeObject(forKey: "open") as? Int
        ownerIdCard = aDecoder.decodeObject(forKey: "owner_id_card") as? String
        providerIdCard = aDecoder.decodeObject(forKey: "provider_id_card") as? String
        providerLicense = aDecoder.decodeObject(forKey: "provider_license") as? String
        rate = aDecoder.decodeObject(forKey: "rate") as? Int
        rememberToken = aDecoder.decodeObject(forKey: "remember_token") as? String
        reviews = aDecoder.decodeObject(forKey: "reviews") as? [AnyObject]
        status = aDecoder.decodeObject(forKey: "status") as? String
        timeFrom = aDecoder.decodeObject(forKey: "time_from") as? String
        timeTo = aDecoder.decodeObject(forKey: "time_to") as? String
        type = aDecoder.decodeObject(forKey: "type") as? Int
        userCategories = aDecoder.decodeObject(forKey: "user_categories") as? [AnyObject]
        paymentCardsCount = aDecoder.decodeObject(forKey: "payment_cards_count") as? Int
            walletAmount = aDecoder.decodeObject(forKey: "wallet_amount") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if accessToken != nil{
            aCoder.encode(accessToken, forKey: "access_token")
        }
        if activity != nil{
            aCoder.encode(activity, forKey: "activity")
        }
        if activityId != nil{
            aCoder.encode(activityId, forKey: "activity_id")
        }
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if available != nil{
            aCoder.encode(available, forKey: "available")
        }
        if bio != nil{
            aCoder.encode(bio, forKey: "bio")
        }
        if carLicense != nil{
            aCoder.encode(carLicense, forKey: "car_license")
        }
        if carsCount != nil{
            aCoder.encode(carsCount, forKey: "cars_count")
        }
        if city != nil{
            aCoder.encode(city, forKey: "city")
        }
        if cityId != nil{
            aCoder.encode(cityId, forKey: "city_id")
        }
        if country != nil{
            aCoder.encode(country, forKey: "country")
        }
        if countryId != nil{
            aCoder.encode(countryId, forKey: "country_id")
        }
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if discountPercent != nil{
            aCoder.encode(discountPercent, forKey: "discount_percent")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if imageProfile != nil{
            aCoder.encode(imageProfile, forKey: "image_profile")
        }
        if images != nil{
            aCoder.encode(images, forKey: "images")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "latitude")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "longitude")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if open != nil{
            aCoder.encode(open, forKey: "open")
        }
        if ownerIdCard != nil{
            aCoder.encode(ownerIdCard, forKey: "owner_id_card")
        }
        if providerIdCard != nil{
            aCoder.encode(providerIdCard, forKey: "provider_id_card")
        }
        if providerLicense != nil{
            aCoder.encode(providerLicense, forKey: "provider_license")
        }
        if rate != nil{
            aCoder.encode(rate, forKey: "rate")
        }
        if rememberToken != nil{
            aCoder.encode(rememberToken, forKey: "remember_token")
        }
        if reviews != nil{
            aCoder.encode(reviews, forKey: "reviews")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if timeFrom != nil{
            aCoder.encode(timeFrom, forKey: "time_from")
        }
        if timeTo != nil{
            aCoder.encode(timeTo, forKey: "time_to")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if userCategories != nil{
            aCoder.encode(userCategories, forKey: "user_categories")
        }
        if paymentCardsCount != nil{
            aCoder.encode(paymentCardsCount, forKey: "payment_cards_count")
        }
        if walletAmount != nil{
            aCoder.encode(walletAmount, forKey: "wallet_amount")
        }
    }

}
