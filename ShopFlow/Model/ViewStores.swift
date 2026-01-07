//
//  ViewStores.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/14/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON

class ViewStores : NSObject, NSCoding{

    var activity : ConstantsCategory?
    var activityId : Int?
    var address : String?
    var available : Int?
    var bio : String?
    var carLicense : String?
    var carsCount : Int?
    var city : City?
    var cityId : Int?
    var country : City?
    var countryId : Int?
    var createdAt : String?
    var discountPercent : Int?
    var email : String?
    var id : Int?
    var imageProfile : String?
    var images : [Image]?
    var latitude : Double?
    var longitude : Double?
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
    var userCategories : [UserCategory]?
    var descriptionField : String?
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let activityJson = json["activity"]
        if !activityJson.isEmpty{
            activity = ConstantsCategory(fromJson: activityJson)
        }
        activityId = json["activity_id"].intValue
        address = json["address"].stringValue
        available = json["available"].intValue
        bio = json["bio"].stringValue
        carLicense = json["car_license"].stringValue
        carsCount = json["cars_count"].intValue
        let cityJson = json["city"]
        if !cityJson.isEmpty{
            city = City(fromJson: cityJson)
        }
        cityId = json["city_id"].intValue
        let countryJson = json["country"]
        if !countryJson.isEmpty{
            country = City(fromJson: countryJson)
        }
        countryId = json["country_id"].intValue
        createdAt = json["created_at"].stringValue
        discountPercent = json["discount_percent"].intValue
        email = json["email"].stringValue
        id = json["id"].intValue
        imageProfile = json["image_profile"].stringValue
        images = [Image]()
        let imagesArray = json["images"].arrayValue
        for imagesJson in imagesArray{
            let value = Image(fromJson: imagesJson)
            self.images?.append(value)
        }
        latitude = json["latitude"].doubleValue
        longitude = json["longitude"].doubleValue
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
        descriptionField = json["bio"].stringValue
        userCategories = [UserCategory]()
        let userCategoriesArray = json["user_categories"].arrayValue
        for userCategoriesJson in userCategoriesArray{
            let value = UserCategory(fromJson: userCategoriesJson)
            self.userCategories?.append(value)
        }
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if activity != nil{
            dictionary["activity"] = activity?.toDictionary()
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
            dictionary["city"] = city?.toDictionary()
        }
        if cityId != nil{
            dictionary["city_id"] = cityId
        }
        if country != nil{
            dictionary["country"] = country?.toDictionary()
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
        var dictionaryElements = [[String:Any]]()
        for imagesElement in (images ?? []) {
            dictionaryElements.append(imagesElement.toDictionary())
        }
        dictionary["images"] = dictionaryElements
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
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if userCategories != nil{
        var dictionaryElements = [[String:Any]]()
        for userCategoriesElement in (userCategories ?? []) {
            dictionaryElements.append(userCategoriesElement.toDictionary())
        }
        dictionary["userCategories"] = dictionaryElements
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        activity = aDecoder.decodeObject(forKey: "activity") as? ConstantsCategory
        activityId = aDecoder.decodeObject(forKey: "activity_id") as? Int
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        address = aDecoder.decodeObject(forKey: "address") as? String
        available = aDecoder.decodeObject(forKey: "available") as? Int
        bio = aDecoder.decodeObject(forKey: "bio") as? String
        carLicense = aDecoder.decodeObject(forKey: "car_license") as? String
        carsCount = aDecoder.decodeObject(forKey: "cars_count") as? Int
        city = aDecoder.decodeObject(forKey: "city") as? City
        cityId = aDecoder.decodeObject(forKey: "city_id") as? Int
        country = aDecoder.decodeObject(forKey: "country") as? City
        countryId = aDecoder.decodeObject(forKey: "country_id") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        discountPercent = aDecoder.decodeObject(forKey: "discount_percent") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        imageProfile = aDecoder.decodeObject(forKey: "image_profile") as? String
        images = aDecoder.decodeObject(forKey: "images") as? [Image]
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Double
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
        userCategories = aDecoder.decodeObject(forKey: "user_categories") as? [UserCategory]
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
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
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
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

    }

}
class City : NSObject, NSCoding{

    var countryId : Int?
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
        countryId = json["country_id"].intValue
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
        if countryId != nil{
            dictionary["country_id"] = countryId
        }
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
        countryId = aDecoder.decodeObject(forKey: "country_id") as? Int
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
        if countryId != nil{
            aCoder.encode(countryId, forKey: "country_id")
        }
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
class Image : NSObject, NSCoding{

    var createdAt : String?
    var details : String?
    var id : Int?
    var image : String?
    var status : String?
    var userId : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"].stringValue
        details = json["details"].stringValue
        id = json["id"].intValue
        image = json["image"].stringValue
        status = json["status"].stringValue
        userId = json["user_id"].intValue
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
        if details != nil{
            dictionary["details"] = details
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if status != nil{
            dictionary["status"] = status
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
        details = aDecoder.decodeObject(forKey: "details") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
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
        if details != nil{
            aCoder.encode(details, forKey: "details")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }

    }

}

class UserCategory : NSObject, NSCoding{

    var category : ConstantsCategory?
    var categoryId : Int?
    var createdAt : String?
    var deletedAt : String?
    var id : Int?
    var status : String?
    var updatedAt : String?
    var userId : Int?

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
        createdAt = json["created_at"].stringValue
        deletedAt = json["deleted_at"].stringValue
        id = json["id"].intValue
        status = json["status"].stringValue
        updatedAt = json["updated_at"].stringValue
        userId = json["user_id"].intValue
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
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if deletedAt != nil{
            dictionary["deleted_at"] = deletedAt
        }
        if id != nil{
            dictionary["id"] = id
        }
        if status != nil{
            dictionary["status"] = status
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
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
        category = aDecoder.decodeObject(forKey: "category") as? ConstantsCategory
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        deletedAt = aDecoder.decodeObject(forKey: "deleted_at") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        status = aDecoder.decodeObject(forKey: "status") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
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
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if deletedAt != nil{
            aCoder.encode(deletedAt, forKey: "deleted_at")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
        if userId != nil{
            aCoder.encode(userId, forKey: "user_id")
        }

    }

}
