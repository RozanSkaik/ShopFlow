//
//  CustomClass.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//
import UIKit
import Foundation
import CoreLocation

class Constants {
    static let shared = Constants()
    
    enum MenuItem {
        case about
        case terms
        case display
        case complaint
        case questions
        case language
        case share
        case call
        
        var name: String {
            switch self {
            case .about:
                return "عن تطبيقكم"
            case .terms:
                return "سياسة الإستخدام"
            case .display:
                return "طريقة العرض"
            case .complaint:
                return "الشكاوي والإستفسارات"
            case .questions:
                return "أسئلة وأجوبة"
            case .language:
                return "لغة التطبيق"
            case .share:
                return "شارك التطبيق"
            case .call:
                return "اتصل بنا"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .about:
                return "about".image_
            case .terms:
                return "terms".image_
            case .display:
                return "display".image_
            case .complaint:
                return "complaint".image_
            case .questions:
                return "questions".image_
            case .language:
                return "language".image_
            case .share:
                return "share".image_
            case .call:
                return "call".image_
            }
        }
        var isHiddenArrow: Bool{
            switch self {
            case .about:
                return false
            case .terms:
                return true
            case .display:
                return false
            case .complaint:
                return true
            case .questions:
                return true
            case .language:
                return false
            case .share:
                return true
            case .call:
                return true
            }
        }
        var isShowLanguage: Bool{
            switch self {
            case .about:
                return true
            case .terms:
                return true
            case .display:
                return true
            case .complaint:
                return true
            case .questions:
                return true
            case .language:
                return false
            case .share:
                return true
            case .call:
                return true
            }
        }
    }
    enum PathItem {
        case sending
        case repairing
        case sent
        
        var name: String {
            switch self {
            case .sending:
                return "توصيل الطلب"
            case .repairing:
                return "تجهيز الطلب"
            case .sent:
                return "ارسلنا طلبك"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .sending:
                return "sending_order".image_
            case .repairing:
                return "repair_order".image_
            case .sent:
                return "send_order".image_
            }
        }
    }
    enum Questions {
        case one
        case two
        case three
        case four
        
        var name: String {
            switch self{
            case .one:
                return "أحتاج مساعدة في طلبي الحالي"
            case .two:
                return "كيف أطلب من تطبيقكم؟"
            case .three:
                return "طريقة العرض"
            case .four:
                return "لدي اقتراح"
                
            }
        }
        
    }
    enum DigitalServices {
        case adv
        case shopping
        case video
        case photo
        case code
        case coffee
        case design
        case translate
        case more
        var name: String {
            switch self {
            case .adv:
                return "دعاية و اعلان"
            case .shopping:
                return "تسوق"
            case .video:
                return "انتاج مرئي و سمعي"
            case .photo:
                return "تصوير"
            case .code:
                return "برمجة"
            case .coffee:
                return "مباشرين القهوة"
            case .design:
                return "التصميم"
            case .translate:
                return "ترجمة"
            case .more:
                return "أخرى"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .adv:
                return "ic_ad".image_
            case .shopping:
                return "ic_shopping".image_
            case .video:
                return "vedio".image_
            case .photo:
                return "ic_camera".image_
            case .code:
                return "ic_code".image_
            case .coffee:
                return "coffee".image_
            case .design:
                return "ic_design".image_
            case .translate:
                return "translate".image_
            case .more:
                return "more".image_
            }
        }
    }
    enum OrderStatus{
        case new
        case storeAccept
        case orderToDriver
        case acceptDromDriver
        case deliverOrderToClient
        case reciveOrder
        case orderCancel
        case orderReject
        
        var statusNo: Int{
            switch self{
            case .new:
                return 0
            case .storeAccept:
                return 1
            case .orderToDriver:
                return 2
            case .acceptDromDriver:
                return 3
            case .deliverOrderToClient:
                return 4
            case .reciveOrder:
                return 5
            case .orderCancel:
                return 6
            case .orderReject:
                return 7
            }
        }
        
        var status: String{
            switch self{
            case .new:
                return "أرسلنا طلبك"
            case .storeAccept:
                return "تجهيز الطلب"
            case .orderToDriver:
                return "توصيل الطلب"
            case .acceptDromDriver:
                return "تم الانطلاق"
            case .deliverOrderToClient:
                return "تم التوصيل"
            case .reciveOrder:
                return "تم الإستلام"
            case .orderCancel:
                return "طلب ملغى"
            case .orderReject:
                return "طلب مرفوض"
            }
        }
        var image: UIImage? {
            switch self {
            case .new:
                return "sending_orders".image_
            case .storeAccept:
                return "repair_order".image_
            case .orderToDriver:
                return "sent_order".image_
            case .acceptDromDriver:
                return "sending_orders".image_
            case .deliverOrderToClient:
                return "repair_order".image_
            case .reciveOrder:
                return "sent_order".image_
            case .orderCancel:
                return "sent_order".image_
            case .orderReject:
                return "sent_order".image_
            }
        }
        var selectedImage: UIImage? {
            switch self {
            case .new:
                return "selected_sending_order".image_
            case .storeAccept:
                return "selected_repair_order".image_
            case .orderToDriver:
                return "selected_send_order".image_
            case .acceptDromDriver:
                return "selected_sending_order".image_
            case .deliverOrderToClient:
                return "selected_repair_order".image_
            case .reciveOrder:
                return "selected_send_order".image_
            case .orderCancel:
                return "selected_send_order".image_
            case .orderReject:
                return "selected_send_order".image_
            }
        }
        var statusImage: UIImage? {
            switch self {
            case .new:
                return "ic_send".image_
            case .storeAccept:
                return "ic_send".image_
            case .orderToDriver:
                return "ic_send".image_
            case .acceptDromDriver:
                return "ic_send".image_
            case .deliverOrderToClient:
                return "ic_send".image_
            case .reciveOrder:
                return "ic_done".image_
            case .orderCancel:
                return "ic_cancel".image_
            case .orderReject:
                return "ic_cancel".image_
            }
        }
        var viewColor: UIColor? {
            switch self {
            case .new:
                return "#D1E8E9".color_
            case .storeAccept:
                return "#D1E8E9".color_
            case .orderToDriver:
                return "#D1E8E9".color_
            case .acceptDromDriver:
                return "#D1E8E9".color_
            case .deliverOrderToClient:
                return "#D1E8E9".color_
            case .reciveOrder:
                return "#D1E8E9".color_
            case .orderCancel:
                return "#FFE6E6".color_
            case .orderReject:
                return "#FFE6E6".color_
            }
        }
        var nameColor: UIColor? {
            switch self {
            case .new:
                return "#24A29B".color_
            case .storeAccept:
                return "#24A29B".color_
            case .orderToDriver:
                return "#24A29B".color_
            case .acceptDromDriver:
                return "#24A29B".color_
            case .deliverOrderToClient:
                return "#24A29B".color_
            case .reciveOrder:
                return "#24A29B".color_
            case .orderCancel:
                return "#FF0000".color_
            case .orderReject:
                return "#FF0000".color_
            }
            
        }
        
        func getStatusName(statusNo: Int) -> OrderStatus {
            if statusNo == 0{
                return .new
            }else if statusNo == 1{
                return .storeAccept
            }else if statusNo == 2{
                return .orderToDriver
            }else if statusNo == 3{
                return .acceptDromDriver
            }else if statusNo == 4{
                return .deliverOrderToClient
            }else if statusNo == 5{
                return .reciveOrder
            }else if statusNo == 6{
                return .orderCancel
            }else if statusNo == 7{
                return .orderReject
            }else{
                return .new
            }
            
        }
        
    }
    func getStatusName(statusNo: Int) -> OrderStatus {
        if statusNo == 0{
            return .new
        }else if statusNo == 1{
            return .storeAccept
        }else if statusNo == 2{
            return .orderToDriver
        }else if statusNo == 3{
            return .acceptDromDriver
        }else if statusNo == 4{
            return .deliverOrderToClient
        }else if statusNo == 5{
            return .reciveOrder
        }else if statusNo == 6{
            return .orderCancel
        }else if statusNo == 7{
            return .orderReject
        }else{
            return .new
        }
        
    }
    func getDistance(fromLat: Double,fromLong: Double) -> String{
        let lat = fromLat
        let long = fromLong
        let coordinate0 = CLLocation(latitude: UserDefaults.standard.double(forKey: "latitude"), longitude: UserDefaults.standard.double(forKey: "longitude"))
        let coordinate1 = CLLocation(latitude: lat, longitude: long)
        let distanceInMeters = coordinate0.distance(from: coordinate1)
        let distanceInKM = Measurement(value: distanceInMeters, unit: UnitLength.meters).converted(to: .kilometers)
        return "\(Int(distanceInKM.value)) كم"
    }
    
    func getAddress(Latitude: Double, Longitude: Double) -> String{
        var address: String?
        var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
        
        let ceo: CLGeocoder = CLGeocoder()
        center.latitude = Latitude
        center.longitude = Longitude
        
        let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)
        ceo.reverseGeocodeLocation(loc, completionHandler:
            {(placemarks, error) in
                if (error != nil)
                {
                    print("reverse geodcode fail: \(error!.localizedDescription)")
                }
                if placemarks == nil{
                    return
                }
                let pm = placemarks as! [CLPlacemark]
                if pm.count > 0 {
                    address = ""
                    let pm = placemarks![0]
                    address = "\(pm.country ?? "غير معروف")"
                }
        })
        return address ?? ""
    }
}
