//
//  GlobalConstant.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation

let DefualtImagePlaceHolder = "placeholder"

class GlobalConstant{
    static let BaseUrl = "http://ShopFlow.salehly.com/public/"
    static let APIV = BaseUrl + "api/"
    
    static let Login = APIV + "login"
    static let SignUp = APIV + "signUp"
    static let ResetPassword = APIV + "forgotPassword"
    static let SendCode = APIV + "requestNewCode"
    static let CheckCode = APIV + "checkCode"
    static let editProfile = APIV + "editProfile"
    static let Logout = APIV + "logout"
    static let Categories = APIV + "categories"
    static let Constants = APIV + "settings"
    static let Profile = APIV + "profile"
    static let ViewStoresById = APIV + "viewStores?activity_id="
    static let ViewStoreProductsById = APIV + "viewStoreProducts?store_id="
    static let AddToCart = APIV + "addProductToCart"
    static let DeleteCart = APIV + "deleteFromCart?product_id="
    static let FavoriteCart = APIV + "addProductToFav?product_id="
    static let DeleteFavoriteCart = APIV + "deleteProductFromFav?product_id="
    static let changeQuantity = APIV + "changeQuantity"
    static let MyCart = APIV + "myCart"
    static let checkout = APIV + "checkout"
    static let ShowFavorite = APIV + "myFavProducts"
    static let HomePageCategories = APIV + "getHomePageCategories"
    static let createNewOrder = APIV + "createNewOrder"
    static let requestService = APIV + "requestService"
    static let requestCar = APIV + "requestCar"
    static let requestOtherService = APIV + "requestOtherService"
    static let getCar = APIV + "getCars"
    static let storesFreeDelivery = APIV + "storesFreeDelivery"
    static let getAds = APIV + "getAds"
    static let getOffers = APIV + "getOffers"
    static let getDigitals = APIV + "getDigitals"
    static let getOtherServices = APIV + "getOtherServices"
    static let requestDigitalService = APIV + "requestDigitalService"
    static let changeNotifiStatus = APIV + "changeNotifiStatus?status="
    static let productDetails = APIV + "productDetails?product_id="
    static let getPaymentMethods = APIV + "getPaymentMethods"
    static let addPaymentCard = APIV + "addPaymentCard"
    static let getMyPaymentCards = APIV + "getMyPaymentCards"
    static let deletePaymentCard = APIV + "deletePaymentCard"
    static let editPaymentCard = APIV + "editPaymentCard"
    static let nearbyStores = APIV + "nearbyStores?latitude="
    static let viewShopFlowProducts = APIV + "viewShopFlowProducts?activity_id="
    static let addNewCoupon = APIV + "addNewCoupon"
    static let getMyCoupons = APIV + "getMyCoupons"
    static let deleteCoupon = APIV + "deleteCoupon?coupon_id="
    static let chargeWallet = APIV + "chargeWallet"
    static let getCategories = APIV + "getCategories?store_id="
    static let searchProducts = APIV + "searchProducts"
    static let searchOffers = APIV + "searchOffers"
    static let getMyAddresses = APIV + "getMyAddresses"
    static let addNewAddress = APIV + "addNewAddress"
    static let editMyAddress = APIV + "editMyAddress"
    static let deleteAddress = APIV + "deleteMyAddress"
    static let getClientOrders = APIV + "getClientOrders"
    static let getClientOrderDetails = APIV + "getClientOrderDetails?order_id="
    static let clientCancelOrder = APIV + "clientCancelOrder?order_id="

}

