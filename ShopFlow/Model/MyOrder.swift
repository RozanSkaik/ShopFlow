//
//  MyOrder.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/29/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON


class MyOrder : NSObject, NSCoding{

    var car : Car?
    var carId : Int?
    var category : ConstantsCategory?
    var categoryId : Int?
    var coupon : Copouns?
    var couponAmount : Int?
    var couponId : Int?
    var couponPercent : Int?
    var createdAt : String?
    var dateFrom : String?
    var dateTo : String?
    var deliveryCost : Int?
    var details : String?
    var digitalId : Int?
    var driver : Driver?
    var driverId : Int?
    var email : String?
    var finalTotal : Float?
    var fromLatitude : String?
    var fromLongitude : String?
    var id : Int?
    var mealsCount : Int?
    var mobile : String?
    var name : String?
    var orderProducts : [OrderProducts]?
    var orderedDate : String?
    var paymentMethod : String?
    var priority : String?
    var status : Int?
    var store : ViewStores?
    var storeId : Int?
    var subTotal : Int?
    var toLatitude : String?
    var toLongitude : String?
    var type : String?
    var user : User?
    var userAddress : Addresses?
    var userAddressId : Int?
    var userId : Int?
    var vatAmount : Float?
    var vatPercent : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let carJson = json["car"]
        if !carJson.isEmpty{
            car = Car(fromJson: carJson)
        }
        carId = json["car_id"].intValue
        let categoryJson = json["category"]
        if !categoryJson.isEmpty{
            category = ConstantsCategory(fromJson: categoryJson)
        }
        categoryId = json["category_id"].intValue
        let couponJson = json["coupon"]
        if !couponJson.isEmpty{
            coupon = Copouns(fromJson: couponJson)
        }
        couponAmount = json["coupon_amount"].intValue
        couponId = json["coupon_id"].intValue
        couponPercent = json["coupon_percent"].intValue
        createdAt = json["created_at"].stringValue
        dateFrom = json["date_from"].stringValue
        dateTo = json["date_to"].stringValue
        deliveryCost = json["delivery_cost"].intValue
        details = json["details"].stringValue
        digitalId = json["digital_id"].intValue
        let driverJson = json["driver"]
        if !driverJson.isEmpty{
            driver = Driver(fromJson: couponJson)
        }
        driverId = json["driver_id"].intValue
        email = json["email"].stringValue
        finalTotal = json["final_total"].floatValue
        fromLatitude = json["from_latitude"].stringValue
        fromLongitude = json["from_longitude"].stringValue
        id = json["id"].intValue
        mealsCount = json["meals_count"].intValue
        mobile = json["mobile"].stringValue
        name = json["name"].stringValue
        orderProducts = [OrderProducts]()
        let orderProductsArray = json["order_products"].arrayValue
        for orderProductsJson in orderProductsArray{
            let value = OrderProducts(fromJson: orderProductsJson)
            orderProducts?.append(value)
        }
        orderedDate = json["ordered_date"].stringValue
        paymentMethod = json["payment_method"].stringValue
        priority = json["priority"].stringValue
        status = json["status"].intValue
        let storeJson = json["store"]
        if !storeJson.isEmpty{
            store = ViewStores(fromJson: storeJson)
        }
        storeId = json["store_id"].intValue
        subTotal = json["sub_total"].intValue
        toLatitude = json["to_latitude"].stringValue
        toLongitude = json["to_longitude"].stringValue
        type = json["type"].stringValue
        let userJson = json["user"]
        if !userJson.isEmpty{
            user = User(fromJson: userJson)
        }
        let userAddressJson = json["user_address"]
        if !userAddressJson.isEmpty{
            userAddress = Addresses(fromJson: userAddressJson)
        }
        userAddressId = json["user_address_id"].intValue
        userId = json["user_id"].intValue
        vatAmount = json["vat_amount"].floatValue
        vatPercent = json["vat_percent"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if car != nil{
            dictionary["car"] = car
        }
        if carId != nil{
            dictionary["car_id"] = carId
        }
        if category != nil{
            dictionary["category"] = category
        }
        if categoryId != nil{
            dictionary["category_id"] = categoryId
        }
        if coupon != nil{
            dictionary["coupon"] = coupon
        }
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
        if dateFrom != nil{
            dictionary["date_from"] = dateFrom
        }
        if dateTo != nil{
            dictionary["date_to"] = dateTo
        }
        if deliveryCost != nil{
            dictionary["delivery_cost"] = deliveryCost
        }
        if details != nil{
            dictionary["details"] = details
        }
        if digitalId != nil{
            dictionary["digital_id"] = digitalId
        }
        if driver != nil{
            dictionary["driver"] = driver
        }
        if driverId != nil{
            dictionary["driver_id"] = driverId
        }
        if email != nil{
            dictionary["email"] = email
        }
        if finalTotal != nil{
            dictionary["final_total"] = finalTotal
        }
        if fromLatitude != nil{
            dictionary["from_latitude"] = fromLatitude
        }
        if fromLongitude != nil{
            dictionary["from_longitude"] = fromLongitude
        }
        if id != nil{
            dictionary["id"] = id
        }
        if mealsCount != nil{
            dictionary["meals_count"] = mealsCount
        }
        if mobile != nil{
            dictionary["mobile"] = mobile
        }
        if name != nil{
            dictionary["name"] = name
        }
        if orderProducts != nil{
            dictionary["order_products"] = orderProducts
        }
        if orderedDate != nil{
            dictionary["ordered_date"] = orderedDate
        }
        if paymentMethod != nil{
            dictionary["payment_method"] = paymentMethod
        }
        if priority != nil{
            dictionary["priority"] = priority
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
        if subTotal != nil{
            dictionary["sub_total"] = subTotal
        }
        if toLatitude != nil{
            dictionary["to_latitude"] = toLatitude
        }
        if toLongitude != nil{
            dictionary["to_longitude"] = toLongitude
        }
        if type != nil{
            dictionary["type"] = type
        }
        if user != nil{
            dictionary["user"] = user?.toDictionary()
        }
        if userAddress != nil{
            dictionary["user_address"] = userAddress
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
        car = aDecoder.decodeObject(forKey: "car") as? Car
        carId = aDecoder.decodeObject(forKey: "car_id") as? Int
        category = aDecoder.decodeObject(forKey: "category") as? ConstantsCategory
        categoryId = aDecoder.decodeObject(forKey: "category_id") as? Int
        coupon = aDecoder.decodeObject(forKey: "coupon") as? Copouns
        couponAmount = aDecoder.decodeObject(forKey: "coupon_amount") as? Int
        couponId = aDecoder.decodeObject(forKey: "coupon_id") as? Int
        couponPercent = aDecoder.decodeObject(forKey: "coupon_percent") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        dateFrom = aDecoder.decodeObject(forKey: "date_from") as? String
        dateTo = aDecoder.decodeObject(forKey: "date_to") as? String
        deliveryCost = aDecoder.decodeObject(forKey: "delivery_cost") as? Int
        details = aDecoder.decodeObject(forKey: "details") as? String
        digitalId = aDecoder.decodeObject(forKey: "digital_id") as? Int
        driver = aDecoder.decodeObject(forKey: "driver") as? Driver
        driverId = aDecoder.decodeObject(forKey: "driver_id") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? String
        finalTotal = aDecoder.decodeObject(forKey: "final_total") as? Float
        fromLatitude = aDecoder.decodeObject(forKey: "from_latitude") as? String
        fromLongitude = aDecoder.decodeObject(forKey: "from_longitude") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        mealsCount = aDecoder.decodeObject(forKey: "meals_count") as? Int
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        orderProducts = aDecoder.decodeObject(forKey: "order_products") as? [OrderProducts]
        orderedDate = aDecoder.decodeObject(forKey: "ordered_date") as? String
        paymentMethod = aDecoder.decodeObject(forKey: "payment_method") as? String
        priority = aDecoder.decodeObject(forKey: "priority") as? String
        status = aDecoder.decodeObject(forKey: "status") as? Int
        store = aDecoder.decodeObject(forKey: "store") as? ViewStores
        storeId = aDecoder.decodeObject(forKey: "store_id") as? Int
        subTotal = aDecoder.decodeObject(forKey: "sub_total") as? Int
        toLatitude = aDecoder.decodeObject(forKey: "to_latitude") as? String
        toLongitude = aDecoder.decodeObject(forKey: "to_longitude") as? String
        type = aDecoder.decodeObject(forKey: "type") as? String
        user = aDecoder.decodeObject(forKey: "user") as? User
        userAddress = aDecoder.decodeObject(forKey: "user_address") as? Addresses
        userAddressId = aDecoder.decodeObject(forKey: "user_address_id") as? Int
        userId = aDecoder.decodeObject(forKey: "user_id") as? Int
        vatAmount = aDecoder.decodeObject(forKey: "vat_amount") as? Float
        vatPercent = aDecoder.decodeObject(forKey: "vat_percent") as? Int
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if car != nil{
            aCoder.encode(car, forKey: "car")
        }
        if carId != nil{
            aCoder.encode(carId, forKey: "car_id")
        }
        if category != nil{
            aCoder.encode(category, forKey: "category")
        }
        if categoryId != nil{
            aCoder.encode(categoryId, forKey: "category_id")
        }
        if coupon != nil{
            aCoder.encode(coupon, forKey: "coupon")
        }
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
        if dateFrom != nil{
            aCoder.encode(dateFrom, forKey: "date_from")
        }
        if dateTo != nil{
            aCoder.encode(dateTo, forKey: "date_to")
        }
        if deliveryCost != nil{
            aCoder.encode(deliveryCost, forKey: "delivery_cost")
        }
        if details != nil{
            aCoder.encode(details, forKey: "details")
        }
        if digitalId != nil{
            aCoder.encode(digitalId, forKey: "digital_id")
        }
        if driver != nil{
            aCoder.encode(driver, forKey: "driver")
        }
        if driverId != nil{
            aCoder.encode(driverId, forKey: "driver_id")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if finalTotal != nil{
            aCoder.encode(finalTotal, forKey: "final_total")
        }
        if fromLatitude != nil{
            aCoder.encode(fromLatitude, forKey: "from_latitude")
        }
        if fromLongitude != nil{
            aCoder.encode(fromLongitude, forKey: "from_longitude")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if mealsCount != nil{
            aCoder.encode(mealsCount, forKey: "meals_count")
        }
        if mobile != nil{
            aCoder.encode(mobile, forKey: "mobile")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if orderProducts != nil{
            aCoder.encode(orderProducts, forKey: "order_products")
        }
        if orderedDate != nil{
            aCoder.encode(orderedDate, forKey: "ordered_date")
        }
        if paymentMethod != nil{
            aCoder.encode(paymentMethod, forKey: "payment_method")
        }
        if priority != nil{
            aCoder.encode(priority, forKey: "priority")
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
        if subTotal != nil{
            aCoder.encode(subTotal, forKey: "sub_total")
        }
        if toLatitude != nil{
            aCoder.encode(toLatitude, forKey: "to_latitude")
        }
        if toLongitude != nil{
            aCoder.encode(toLongitude, forKey: "to_longitude")
        }
        if type != nil{
            aCoder.encode(type, forKey: "type")
        }
        if user != nil{
            aCoder.encode(user, forKey: "user")
        }
        if userAddress != nil{
            aCoder.encode(userAddress, forKey: "user_address")
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
class OrderProducts : NSObject, NSCoding{

    var createdAt : String?
    var id : Int?
    var orderId : Int?
    var price : Int?
    var product : ShopFlowProducts?
    var productId : Int?
    var quantity : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        createdAt = json["created_at"].stringValue
        id = json["id"].intValue
        orderId = json["order_id"].intValue
        price = json["price"].intValue
        let productJson = json["product"]
        if !productJson.isEmpty{
            product = ShopFlowProducts(fromJson: productJson)
        }
        productId = json["product_id"].intValue
        quantity = json["quantity"].intValue
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
        if orderId != nil{
            dictionary["order_id"] = orderId
        }
        if price != nil{
            dictionary["price"] = price
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
        orderId = aDecoder.decodeObject(forKey: "order_id") as? Int
        price = aDecoder.decodeObject(forKey: "price") as? Int
        product = aDecoder.decodeObject(forKey: "product") as? ShopFlowProducts
        productId = aDecoder.decodeObject(forKey: "product_id") as? Int
        quantity = aDecoder.decodeObject(forKey: "quantity") as? Int
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
        if orderId != nil{
            aCoder.encode(orderId, forKey: "order_id")
        }
        if price != nil{
            aCoder.encode(price, forKey: "price")
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

    }

}
class Driver : NSObject, NSCoding{

    var activity : AnyObject?
    var activityId : Int?
    var address : String?
    var addresses : [Addresses]?
    var available : Int?
    var bio : String?
    var city : City?
    var cityId : Int?
    var country : City?
    var countryId : Int?
    var createdAt : String?
    var deliveryCost : Int?
    var discountPercent : Int?
    var email : String?
    var id : Int?
    var imageProfile : String?
    var images : [AnyObject]?
    var latitude : Float?
    var longitude : Float?
    var mobile : String?
    var name : String?
    var newOfferNotifications : Int?
    var newStoreNotifications : Int?
    var open : Int?
    var orderNotifications : Int?
    var paymentCardsCount : Int?
    var rate : Int?
    var rememberToken : String?
    var reviews : [ConstantsCategory]?
    var status : String?
    var timeFrom : String?
    var timeTo : String?
    var type : Int?
    var userCategories : [UserCategory]?
    var walletAmount : Int?

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        activity = json["activity"] as AnyObject
        activityId = json["activity_id"].intValue
        address = json["address"].stringValue
        addresses = [Addresses]()
        let addressesArray = json["addresses"].arrayValue
        for addressesJson in addressesArray{
            let value = Addresses(fromJson: addressesJson)
            addresses?.append(value)
        }
        available = json["available"].intValue
        bio = json["bio"].stringValue
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
        deliveryCost = json["delivery_cost"].intValue
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
        latitude = json["latitude"].floatValue
        longitude = json["longitude"].floatValue
        mobile = json["mobile"].stringValue
        name = json["name"].stringValue
        newOfferNotifications = json["new_offer_notifications"].intValue
        newStoreNotifications = json["new_store_notifications"].intValue
        open = json["open"].intValue
        orderNotifications = json["order_notifications"].intValue
        paymentCardsCount = json["payment_cards_count"].intValue
        rate = json["rate"].intValue
        rememberToken = json["remember_token"].stringValue
        reviews = [ConstantsCategory]()
        let reviewsArray = json["reviews"].arrayValue
        for reviewsJson in reviewsArray{
            let value = ConstantsCategory(fromJson: reviewsJson)
            reviews?.append(value)
        }
        status = json["status"].stringValue
        timeFrom = json["time_from"].stringValue
        timeTo = json["time_to"].stringValue
        type = json["type"].intValue
        userCategories = [UserCategory]()
        let userCategoriesArray = json["user_categories"].arrayValue
        for userCategoriesJson in userCategoriesArray{
            let value = UserCategory(fromJson: userCategoriesJson)
            self.userCategories?.append(value)
        }
        walletAmount = json["wallet_amount"].intValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if activity != nil{
            dictionary["activity"] = activity
        }
        if activityId != nil{
            dictionary["activity_id"] = activityId
        }
        if address != nil{
            dictionary["address"] = address
        }
        if addresses != nil{
            dictionary["addresses"] = addresses
        }
        if available != nil{
            dictionary["available"] = available
        }
        if bio != nil{
            dictionary["bio"] = bio
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
        if deliveryCost != nil{
            dictionary["delivery_cost"] = deliveryCost
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
        if newOfferNotifications != nil{
            dictionary["new_offer_notifications"] = newOfferNotifications
        }
        if newStoreNotifications != nil{
            dictionary["new_store_notifications"] = newStoreNotifications
        }
        if open != nil{
            dictionary["open"] = open
        }
        if orderNotifications != nil{
            dictionary["order_notifications"] = orderNotifications
        }
        if paymentCardsCount != nil{
            dictionary["payment_cards_count"] = paymentCardsCount
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
        activity = aDecoder.decodeObject(forKey: "activity") as? AnyObject
        activityId = aDecoder.decodeObject(forKey: "activity_id") as? Int
        address = aDecoder.decodeObject(forKey: "address") as? String
        addresses = aDecoder.decodeObject(forKey: "addresses") as? [Addresses]
        available = aDecoder.decodeObject(forKey: "available") as? Int
        bio = aDecoder.decodeObject(forKey: "bio") as? String
        city = aDecoder.decodeObject(forKey: "city") as? City
        cityId = aDecoder.decodeObject(forKey: "city_id") as? Int
        country = aDecoder.decodeObject(forKey: "country") as? City
        countryId = aDecoder.decodeObject(forKey: "country_id") as? Int
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        deliveryCost = aDecoder.decodeObject(forKey: "delivery_cost") as? Int
        discountPercent = aDecoder.decodeObject(forKey: "discount_percent") as? Int
        email = aDecoder.decodeObject(forKey: "email") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        imageProfile = aDecoder.decodeObject(forKey: "image_profile") as? String
        images = aDecoder.decodeObject(forKey: "images") as? [AnyObject]
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Float
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Float
        mobile = aDecoder.decodeObject(forKey: "mobile") as? String
        name = aDecoder.decodeObject(forKey: "name") as? String
        newOfferNotifications = aDecoder.decodeObject(forKey: "new_offer_notifications") as? Int
        newStoreNotifications = aDecoder.decodeObject(forKey: "new_store_notifications") as? Int
        open = aDecoder.decodeObject(forKey: "open") as? Int
        orderNotifications = aDecoder.decodeObject(forKey: "order_notifications") as? Int
        paymentCardsCount = aDecoder.decodeObject(forKey: "payment_cards_count") as? Int
        rate = aDecoder.decodeObject(forKey: "rate") as? Int
        rememberToken = aDecoder.decodeObject(forKey: "remember_token") as? String
        reviews = aDecoder.decodeObject(forKey: "reviews") as? [ConstantsCategory]
        status = aDecoder.decodeObject(forKey: "status") as? String
        timeFrom = aDecoder.decodeObject(forKey: "time_from") as? String
        timeTo = aDecoder.decodeObject(forKey: "time_to") as? String
        type = aDecoder.decodeObject(forKey: "type") as? Int
        userCategories = aDecoder.decodeObject(forKey: "user_categories") as? [UserCategory]
        walletAmount = aDecoder.decodeObject(forKey: "wallet_amount") as? Int
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
        if addresses != nil{
            aCoder.encode(addresses, forKey: "addresses")
        }
        if available != nil{
            aCoder.encode(available, forKey: "available")
        }
        if bio != nil{
            aCoder.encode(bio, forKey: "bio")
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
        if deliveryCost != nil{
            aCoder.encode(deliveryCost, forKey: "delivery_cost")
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
        if newOfferNotifications != nil{
            aCoder.encode(newOfferNotifications, forKey: "new_offer_notifications")
        }
        if newStoreNotifications != nil{
            aCoder.encode(newStoreNotifications, forKey: "new_store_notifications")
        }
        if open != nil{
            aCoder.encode(open, forKey: "open")
        }
        if orderNotifications != nil{
            aCoder.encode(orderNotifications, forKey: "order_notifications")
        }
        if paymentCardsCount != nil{
            aCoder.encode(paymentCardsCount, forKey: "payment_cards_count")
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
        if walletAmount != nil{
            aCoder.encode(walletAmount, forKey: "wallet_amount")
        }

    }

}
