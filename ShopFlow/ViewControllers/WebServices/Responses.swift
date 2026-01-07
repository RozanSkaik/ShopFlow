//
//  Responses.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import SwiftyJSON
import MagicalRecord

class Response{
    var success: Bool?
    var message: String?
    var errors: String?
    var code: Int?
    var storeId: Int?
    var accessToken: String?
    var user: User?
    var cart: Cart?
    var constants: Constant?
    
    var viewStoresArray: Array<JSON> = []
    var viewStores: [ViewStores] = []
    
    var viewOffersArray: Array<JSON> = []
    var viewOffers: [Offer] = []
    
    var offer: Offer?
    var delivery_cost: Int?
    
    var viewStoreProducts: [ShopFlowProducts] = []
    var viewStoreProductsArray: Array<JSON> = []
    
    var homePageCategories: [HomePageCategories] = []
    var homePageCategoriesArray: Array<JSON> = []
    
    var categories: [ConstantsCategory] = []
    var categoriesArray: Array<JSON> = []
    
    var shopFlowProducts: [ShopFlowProducts] = []
    var ShopFlowProductsArray: Array<JSON> = []
    
    var randomProducts: [ShopFlowProducts] = []
    var randomProductsArray: Array<JSON> = []
    
    var cars: [Car] = []
    var carsArray: Array<JSON> = []
    
    var cartsArray: Array<JSON> = []
    var carts: [Cart] = []
    var order: Order?
    var sub_total: Int?
    var delivery_costs: Int?
    var vat_precent: Int?
    var vat_amount: String?
    var coupon_percent: Int?
    var coupon_amount: String?
    var final_total: String?
    var user_addresse: String?
    
    var storesFreeDeliveryArray: Array<JSON> = []
    var storesFreeDelivery: [StoresFreeDelivery] = []
    
    var adsArray: Array<JSON> = []
    var ads: [Ads] = []
    var adsImage: [String] = []
    
    var productsImageArray: Array<JSON> = []
    var productsImage: [String] = []

    var digitalsArray: Array<JSON> = []
    var digitals: [HomePageCategories] = []
    
    var paymentsArray: Array<JSON> = []
    var payments: [ConstantsCategory] = []
    
    var myPaymentsArray: Array<JSON> = []
    var myPayments: [Cards] = []
    
    var myAddressArray: Array<JSON> = []
    var myAddress: [Addresses] = []
    
    var myCopounsArray: Array<JSON> = []
    var myCopouns: [Copouns] = []
    
    var myOrdersArray: Array<JSON> = []
    var myOrders: [MyOrder] = []
    
    var clientOrderDetails: MyOrder?
    
    var product: Products?
    var quantity: Int?
    var price: Int?
    var colors: [Color] = []
    var sizes: [Color] = []
    var imagesStore: [Image] = []
    var viewShopFlowProducts: [ShopFlowProducts] = []
    var viewShopFlowProductsArray: Array<JSON> = []
    
    init(json: JSON) {
        self.success = json["status"].boolValue
        self.message = json["message"].stringValue
        self.code = json["code"].intValue
        self.user = User.init(fromJson: json["user"])
        self.offer = Offer.init(fromJson: json["offers"])
        self.product = Products.init(fromJson: json["products"])
        self.order = Order.init(fromJson: json["order"])
        self.accessToken = self.user?.accessToken
        self.constants = Constant.init(fromJson: json["items"])
        self.viewStoresArray = json["stores"].arrayValue
        self.viewOffersArray = json["offers"].arrayValue
        self.categoriesArray = json["categories"].arrayValue
        self.viewStoreProductsArray = json["products"].arrayValue
        self.cartsArray = json["cart"].arrayValue
        self.sub_total = json["sub_total"].intValue
        self.delivery_costs = json["delivery_cost"].intValue
        self.vat_precent = json["vat_precent"].intValue
        self.vat_amount = json["vat_amount"].stringValue
        self.coupon_percent = json["coupon_percent"].intValue
        self.coupon_amount = json["coupon_amount"].stringValue
        self.final_total = json["final_total"].stringValue
        self.user_addresse = json["user_addresse"].stringValue
        self.carsArray = json["cars"].arrayValue
        self.cart = Cart.init(fromJson: json["cart"])
        self.quantity = self.cart?.quantity
        self.price = self.cart?.product?.price
        self.homePageCategoriesArray = json["home_page_categories"].arrayValue
        self.ShopFlowProductsArray = json["ShopFlowProducts"].arrayValue
        self.randomProductsArray = json["random_products"].arrayValue
        self.storesFreeDeliveryArray = json["storesFreeDelivery"].arrayValue
        self.adsArray = json["ads"].arrayValue
        self.digitalsArray = json["digitals"].arrayValue
        self.paymentsArray = json["payment_methods"].arrayValue
        self.myPaymentsArray = json["payment_cards"].arrayValue
        self.viewShopFlowProductsArray = json["products"].arrayValue
        self.myCopounsArray = json["coupons"].arrayValue
        self.myAddressArray = json["addresses"].arrayValue
        self.myOrdersArray = json["client_orders"].arrayValue
        self.clientOrderDetails = MyOrder.init(fromJson: json["order_details"])
        
        viewStores.removeAll()
        for item in viewStoresArray{
            let obj = ViewStores.init(fromJson: item)
            self.storeId = obj.id
            self.imagesStore = obj.images ?? []
            viewStores.append(obj)
        }
        
        viewOffers.removeAll()
        for item in viewOffersArray{
            let obj = Offer.init(fromJson: item)
            self.delivery_cost = obj.deliveryCost
            viewOffers.append(obj)
        }
        categories.removeAll()
        for item in categoriesArray{
            let obj = ConstantsCategory.init(fromJson: item)
            categories.append(obj)
        }
        viewStoreProducts.removeAll()
        for item in viewStoreProductsArray{
            let obj = ShopFlow.ShopFlowProducts(fromJson: item)
            for item in obj.otherImages ?? []{
                self.productsImage.append(item.image ?? "")
            }
            for item in obj.colors ?? []{
                self.colors.append(item)
            }
            for item in obj.sizes ?? []{
                self.sizes.append(item)
            }
            viewStoreProducts.append(obj)
        }
        
        carts.removeAll()
        for item in cartsArray{
            let obj = Cart.init(fromJson: item)
            carts.append(obj)
        }
        cars.removeAll()
        for item in carsArray{
            let obj = Car.init(fromJson: item)
            cars.append(obj)
        }
        homePageCategories.removeAll()
        for item in homePageCategoriesArray{
            let obj = HomePageCategories.init(fromJson: item)
            homePageCategories.append(obj)
        }
        shopFlowProducts.removeAll()
        for item in ShopFlowProductsArray{
            let obj = ShopFlowProducts.init(fromJson: item)
            shopFlowProducts.append(obj)
        }
        storesFreeDelivery.removeAll()
        for item in storesFreeDeliveryArray{
            let obj = StoresFreeDelivery.init(fromJson: item)
            storesFreeDelivery.append(obj)
        }
        ads.removeAll()
        for item in adsArray{
            let obj = Ads.init(fromJson: item)
            self.adsImage.append(obj.image ?? "")
            ads.append(obj)
        }
        
        
        self.productsImage.removeAll()
        for item in self.product?.otherImages ?? []{
            self.productsImage.append(item.image ?? "")
        }
        digitals.removeAll()
        for item in digitalsArray{
            let obj = HomePageCategories.init(fromJson: item)
            digitals.append(obj)
        }
        
        payments.removeAll()
        for item in paymentsArray{
            let obj = ConstantsCategory.init(fromJson: item)
            payments.append(obj)
        }
        myPayments.removeAll()
        for item in myPaymentsArray{
            let obj = Cards.init(fromJson: item)
            myPayments.append(obj)
        }
        viewShopFlowProducts.removeAll()
        for item in viewShopFlowProductsArray{
            let obj = ShopFlowProducts.init(fromJson: item)
            viewShopFlowProducts.append(obj)
        }
        randomProducts.removeAll()
        for item in randomProductsArray{
            let obj = ShopFlowProducts.init(fromJson: item)
            randomProducts.append(obj)
        }
        myCopouns.removeAll()
        for item in myCopounsArray{
            let obj = Copouns.init(fromJson: item)
            myCopouns.append(obj)
        }
        myAddress.removeAll()
        for item in myAddressArray{
            let obj = Addresses.init(fromJson: item)
            myAddress.append(obj)
        }
        myOrders.removeAll()
        for item in myOrdersArray{
            let obj = MyOrder.init(fromJson: item)
            myOrders.append(obj)
        }

    }
}


