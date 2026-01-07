//
//  Constants.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/14/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class Constant : NSObject, NSCoding{

    var aboutUs : ConstantsAboutUs?
    var activities : [ConstantsCategory]?
    var address : String?
    var ads : [ConstantsAd]?
    var appStoreUrl : String?
    var categories : [ConstantsCategory]?
    var countries : [ConstantsCountry]?
    var descriptionField : String?
    var facebook : String?
    var id : Int?
    var image : String?
    var infoEmail : String?
    var instagram : String?
    var latitude : String?
    var linkedIn : String?
    var logo : String?
    var longitude : String?
    var mobile : String?
    var phone : String?
    var playStoreUrl : String?
    var privacy : ConstantsAboutUs?
    var terms : ConstantsAboutUs?
    var title : String?
    var twitter : String?
    var url : String?
    var orders_delivery_cost: Int?
    var request_car_cost: Int?
    var request_service_cost: Int?
    var other_service_cost: Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let aboutUsJson = json["aboutUs"]
        if !aboutUsJson.isEmpty{
            aboutUs = ConstantsAboutUs(fromJson: aboutUsJson)
        }
        activities = [ConstantsCategory]()
        let obj = ConstantsCategory()
        obj.name = "الكل"
        activities?.append(obj)
        let activitiesArray = json["activities"].arrayValue
        for activitiesJson in activitiesArray{
            let value = ConstantsCategory(fromJson: activitiesJson)
            self.activities?.append(value)
        }
        address = json["address"].stringValue
        ads = [ConstantsAd]()
        let adsArray = json["ads"].arrayValue
        for adsJson in adsArray{
            let value = ConstantsAd(fromJson: adsJson)
            self.ads?.append(value)
        }
        appStoreUrl = json["app_store_url"].stringValue
        categories = [ConstantsCategory]()
        let categoriesArray = json["categories"].arrayValue
        for categoriesJson in categoriesArray{
            let value = ConstantsCategory(fromJson: categoriesJson)
            self.categories?.append(value)
        }
        countries = [ConstantsCountry]()
        let countriesArray = json["countries"].arrayValue
        for countriesJson in countriesArray{
            let value = ConstantsCountry(fromJson: countriesJson)
            self.countries?.append(value)
        }
        descriptionField = json["description"].stringValue
        facebook = json["facebook"].stringValue
        id = json["id"].intValue
        image = json["image"].stringValue
        infoEmail = json["info_email"].stringValue
        instagram = json["instagram"].stringValue
        latitude = json["latitude"].stringValue
        linkedIn = json["linked_in"].stringValue
        logo = json["logo"].stringValue
        longitude = json["longitude"].stringValue
        mobile = json["mobile"].stringValue
        phone = json["phone"].stringValue
        playStoreUrl = json["play_store_url"].stringValue
        orders_delivery_cost = json["orders_delivery_cost"].intValue
        request_car_cost = json["request_car_cost"].intValue
        request_service_cost = json["request_service_cost"].intValue
        other_service_cost = json["other_service_cost"].intValue
        let privacyJson = json["privacy"]
        if !privacyJson.isEmpty{
            privacy = ConstantsAboutUs(fromJson: privacyJson)
        }
        let termsJson = json["terms"]
        if !termsJson.isEmpty{
            terms = ConstantsAboutUs(fromJson: termsJson)
        }
        title = json["title"].stringValue
        twitter = json["twitter"].stringValue
        url = json["url"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if aboutUs != nil{
            dictionary["aboutUs"] = aboutUs?.toDictionary()
        }
        if activities != nil{
        var dictionaryElements = [[String:Any]]()
        for activitiesElement in (activities ?? []) {
            dictionaryElements.append(activitiesElement.toDictionary())
        }
        dictionary["activities"] = dictionaryElements
        }
        if address != nil{
            dictionary["address"] = address
        }
        if ads != nil{
        var dictionaryElements = [[String:Any]]()
        for adsElement in (ads ?? []) {
            dictionaryElements.append(adsElement.toDictionary())
        }
        dictionary["ads"] = dictionaryElements
        }
        if appStoreUrl != nil{
            dictionary["app_store_url"] = appStoreUrl
        }
        if categories != nil{
        var dictionaryElements = [[String:Any]]()
        for categoriesElement in (categories ?? []) {
            dictionaryElements.append(categoriesElement.toDictionary())
        }
        dictionary["categories"] = dictionaryElements
        }
        if countries != nil{
        var dictionaryElements = [[String:Any]]()
        for countriesElement in (countries ?? []) {
            dictionaryElements.append(countriesElement.toDictionary())
        }
        dictionary["countries"] = dictionaryElements
        }
        if descriptionField != nil{
            dictionary["description"] = descriptionField
        }
        if facebook != nil{
            dictionary["facebook"] = facebook
        }
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if infoEmail != nil{
            dictionary["info_email"] = infoEmail
        }
        if instagram != nil{
            dictionary["instagram"] = instagram
        }
        if latitude != nil{
            dictionary["latitude"] = latitude
        }
        if linkedIn != nil{
            dictionary["linked_in"] = linkedIn
        }
        if logo != nil{
            dictionary["logo"] = logo
        }
        if longitude != nil{
            dictionary["longitude"] = longitude
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if phone != nil{
            dictionary["phone"] = phone
        }
        if playStoreUrl != nil{
            dictionary["play_store_url"] = playStoreUrl
        }
        if privacy != nil{
            dictionary["privacy"] = privacy?.toDictionary()
        }
        if terms != nil{
            dictionary["terms"] = terms?.toDictionary()
        }
        if title != nil{
            dictionary["title"] = title
        }
        if twitter != nil{
            dictionary["twitter"] = twitter
        }
        if url != nil{
            dictionary["url"] = url
        }
        if orders_delivery_cost != nil{
            dictionary["orders_delivery_cost"] = orders_delivery_cost
        }
        if request_car_cost != nil{
            dictionary["request_car_cost"] = request_car_cost
        }
        if request_service_cost != nil{
            dictionary["request_service_cost"] = request_service_cost
        }
        if other_service_cost != nil{
            dictionary["other_service_cost"] = other_service_cost
        }

        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        aboutUs = aDecoder.decodeObject(forKey: "aboutUs") as? ConstantsAboutUs
        activities = aDecoder.decodeObject(forKey: "activities") as? [ConstantsCategory]
        address = aDecoder.decodeObject(forKey: "address") as? String
        ads = aDecoder.decodeObject(forKey: "ads") as? [ConstantsAd]
        appStoreUrl = aDecoder.decodeObject(forKey: "app_store_url") as? String
        categories = aDecoder.decodeObject(forKey: "categories") as? [ConstantsCategory]
        countries = aDecoder.decodeObject(forKey: "countries") as? [ConstantsCountry]
        descriptionField = aDecoder.decodeObject(forKey: "description") as? String
        facebook = aDecoder.decodeObject(forKey: "facebook") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        infoEmail = aDecoder.decodeObject(forKey: "info_email") as? String
        instagram = aDecoder.decodeObject(forKey: "instagram") as? String
        latitude = aDecoder.decodeObject(forKey: "latitude") as? String
        linkedIn = aDecoder.decodeObject(forKey: "linked_in") as? String
        logo = aDecoder.decodeObject(forKey: "logo") as? String
        longitude = aDecoder.decodeObject(forKey: "longitude") as? String
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        phone = aDecoder.decodeObject(forKey: "phone") as? String
        playStoreUrl = aDecoder.decodeObject(forKey: "play_store_url") as? String
        privacy = aDecoder.decodeObject(forKey: "privacy") as? ConstantsAboutUs
        terms = aDecoder.decodeObject(forKey: "terms") as? ConstantsAboutUs
        title = aDecoder.decodeObject(forKey: "title") as? String
        twitter = aDecoder.decodeObject(forKey: "twitter") as? String
        url = aDecoder.decodeObject(forKey: "url") as? String
        orders_delivery_cost = aDecoder.decodeObject(forKey: "orders_delivery_cost") as? Int
        request_car_cost = aDecoder.decodeObject(forKey: "request_car_cost") as? Int
        request_service_cost = aDecoder.decodeObject(forKey: "request_service_cost") as? Int
        other_service_cost = aDecoder.decodeObject(forKey: "other_service_cost") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if aboutUs != nil{
            aCoder.encode(aboutUs, forKey: "aboutUs")
        }
        if activities != nil{
            aCoder.encode(activities, forKey: "activities")
        }
        if address != nil{
            aCoder.encode(address, forKey: "address")
        }
        if ads != nil{
            aCoder.encode(ads, forKey: "ads")
        }
        if appStoreUrl != nil{
            aCoder.encode(appStoreUrl, forKey: "app_store_url")
        }
        if categories != nil{
            aCoder.encode(categories, forKey: "categories")
        }
        if countries != nil{
            aCoder.encode(countries, forKey: "countries")
        }
        if descriptionField != nil{
            aCoder.encode(descriptionField, forKey: "description")
        }
        if facebook != nil{
            aCoder.encode(facebook, forKey: "facebook")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if infoEmail != nil{
            aCoder.encode(infoEmail, forKey: "info_email")
        }
        if instagram != nil{
            aCoder.encode(instagram, forKey: "instagram")
        }
        if latitude != nil{
            aCoder.encode(latitude, forKey: "latitude")
        }
        if linkedIn != nil{
            aCoder.encode(linkedIn, forKey: "linked_in")
        }
        if logo != nil{
            aCoder.encode(logo, forKey: "logo")
        }
        if longitude != nil{
            aCoder.encode(longitude, forKey: "longitude")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if phone != nil{
            aCoder.encode(phone, forKey: "phone")
        }
        if playStoreUrl != nil{
            aCoder.encode(playStoreUrl, forKey: "play_store_url")
        }
        if privacy != nil{
            aCoder.encode(privacy, forKey: "privacy")
        }
        if terms != nil{
            aCoder.encode(terms, forKey: "terms")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if twitter != nil{
            aCoder.encode(twitter, forKey: "twitter")
        }
        if url != nil{
            aCoder.encode(url, forKey: "url")
        }
        if orders_delivery_cost != nil{
            aCoder.encode(orders_delivery_cost, forKey: "orders_delivery_cost")
        }
        if request_car_cost != nil{
            aCoder.encode(request_car_cost, forKey: "request_car_cost")
        }
        if request_service_cost != nil{
            aCoder.encode(request_service_cost, forKey: "request_service_cost")
        }
        if other_service_cost != nil{
            aCoder.encode(other_service_cost, forKey: "other_service_cost")
        }
    }

}
class ConstantsAboutUs : NSObject, NSCoding{

    var createdAt : String?
    var descriptionField : String?
    var id : Int?
    var image : String?
    var keyWords : String?
    var title : String?
    var views : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"].stringValue
        descriptionField = json["description"].stringValue
        id = json["id"].intValue
        image = json["image"].stringValue
        keyWords = json["key_words"].stringValue
        title = json["title"].stringValue
        views = json["views"].intValue
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
        if id != nil{
            dictionary["id"] = id
        }
        if image != nil{
            dictionary["image"] = image
        }
        if keyWords != nil{
            dictionary["key_words"] = keyWords
        }
        if title != nil{
            dictionary["title"] = title
        }
        if views != nil{
            dictionary["views"] = views
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
        id = aDecoder.decodeObject(forKey: "id") as? Int
        image = aDecoder.decodeObject(forKey: "image") as? String
        keyWords = aDecoder.decodeObject(forKey: "key_words") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
        views = aDecoder.decodeObject(forKey: "views") as? Int
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
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if image != nil{
            aCoder.encode(image, forKey: "image")
        }
        if keyWords != nil{
            aCoder.encode(keyWords, forKey: "key_words")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        if views != nil{
            aCoder.encode(views, forKey: "views")
        }

    }

}

class ConstantsAd : NSObject, NSCoding{

    var createdAt : String?
    var details : String?
    var id : Int?
    var image : String?
    var link : String?
    var status : String?
    var title : String?

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
        link = json["link"].stringValue
        status = json["status"].stringValue
        title = json["title"].stringValue
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
        if link != nil{
            dictionary["link"] = link
        }
        if status != nil{
            dictionary["status"] = status
        }
        if title != nil{
            dictionary["title"] = title
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
        link = aDecoder.decodeObject(forKey: "link") as? String
        status = aDecoder.decodeObject(forKey: "status") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
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
        if link != nil{
            aCoder.encode(link, forKey: "link")
        }
        if status != nil{
            aCoder.encode(status, forKey: "status")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }

}
class ConstantsCountry : NSObject, NSCoding{

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
class ConstantsCategory : NSObject, NSCoding{

    var createdAt : String?
    var id : Int?
    var image : String?
    var name : String?
    var status : String?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    override init() {
        
    }
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
