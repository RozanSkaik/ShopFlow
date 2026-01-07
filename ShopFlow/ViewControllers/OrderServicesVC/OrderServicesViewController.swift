//
//  OrderServicesViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

enum ServicesType{
    case order
    case service
    case car
    case other
}

class OrderServicesViewController: UIViewController {
    
    @IBOutlet weak var lblFromLoc: UILabel!
    
    @IBOutlet weak var lblToLoc: UILabel!
    
    @IBOutlet weak var orderLbl: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var btnTime: UIButton!
    
    @IBOutlet weak var imgTime: UIImageView!
    
    @IBOutlet weak var picBtn: UIButton!
    
    @IBOutlet weak var orderDetailsLbl: JVFloatLabeledTextView!
    
    @IBOutlet weak var orderStack: UIStackView!
    
    @IBOutlet weak var lblOrdersDeliveryCost: UILabel!
    
    var pagetype: ServicesType = .service
    var fromLatitude: Double?
    var fromLongtude: Double?
    var toLatitude: Double?
    var toLongtude: Double?
    var currentDate: Date?
    var fromOrTo: Bool?
    var categoryId: Int?
    var otherId: Int?
    var carsName: [String] = []
    var carId: Int?
    var cars:[Car] = []
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnFromLocation(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.isFromLoc = true
        fromOrTo = vc.isFromLoc
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnToLocation(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.isFromLoc = false
        fromOrTo = vc.isFromLoc
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnTimeDeleviry(_ sender: UIButton) {
        switch pagetype{
        case .service:
            self.datePickerAlert(buttonTitle: sender, currentDateSelected: self.currentDate) { (date) in
                self.currentDate = date
            }
            break
        case .car:
            self.pickerAlert(title: "اختر نوع السيارة", message: "نوع السيارة", currentSelected: carsName[index ?? 0],array: carsName, buttonTitle: sender) {
                self.carId = self.cars[self.index ?? 0].id
            }
            break
        case .order:
            self.datePickerAlert(buttonTitle: sender, currentDateSelected: self.currentDate) { (date) in
                self.currentDate = date
            }
            break
        case .other:
            self.datePickerAlert(buttonTitle: sender, currentDateSelected: self.currentDate) { (date) in
                self.currentDate = date
            }
            break
        }
        
    }
    
    @IBAction func btnPic(_ sender: Any) {
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        switch pagetype{
        case .service:
            let request = ServiceRequest()
            request.details = orderDetailsLbl.text
            request.ordered_date = currentDate?.toString(customFormat: "yyyy-MM-dd HH:mm:ss")
            request.from_latitude = "\(fromLatitude ?? 0.0)"
            request.from_longitude = "\(fromLongtude ?? 0.0)"
            request.to_latitude = "\(toLatitude ?? 0.0)"
            request.to_longitude = "\(toLongtude ?? 0.0)"
            request.request_service_cost = "\(UserDefaults.standard.integer(forKey: "request_service_cost"))"
            if (currentDate ?? Date()) < Date(){
                self.showAlertError(message: "تاريخ التوصيل خاطئ")
            }else {
                RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                    self.showAlertSuccess(message: obj.message ?? "")
                }
            }
            
            break
        case .car:
           let request = CarRequest()
           request.car_id = "\(self.carId ?? 0)"
           request.details = orderDetailsLbl.text
           request.from_latitude = "\(fromLatitude ?? 0.0)"
           request.from_longitude = "\(fromLongtude ?? 0.0)"
           request.to_latitude = "\(toLatitude ?? 0.0)"
           request.to_longitude = "\(toLongtude ?? 0.0)"
           request.request_car_cost = "\(UserDefaults.standard.integer(forKey: "request_car_cost"))"
           RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.showAlertPopUp(title: "تنبيه", message: obj.message ?? "", action1: {
                if obj.success == true{
                    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompleteOrderViewController"){
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }) {
                
            }
           }
            break
        case .order:
            let request = CreateNewOrderRequest()
            request.category_id = "\(self.categoryId ?? 0)"
            request.details = orderDetailsLbl.text
            request.ordered_date = currentDate?.toString(customFormat: "yyyy-MM-dd HH:mm:ss")
            request.from_latitude = "\(fromLatitude ?? 0.0)"
            request.from_longitude = "\(fromLongtude ?? 0.0)"
            request.to_latitude = "\(toLatitude ?? 0.0)"
            request.to_longitude = "\(toLongtude ?? 0.0)"
            request.orders_delivery_cost = "\(UserDefaults.standard.integer(forKey: "orders_delivery_cost"))"
            if (currentDate ?? Date()) < Date(){
                self.showAlertError(message: "تاريخ التوصيل خاطئ")
            }else {
                RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                    self.showAlertSuccess(message: obj.message ?? "")
                }
            }
            break
        case .other:
            let request = CreateOtherServiceRequest()
            request.other_service_id = "\(self.otherId ?? 0)"
            request.details = orderDetailsLbl.text
            request.ordered_date = currentDate?.toString(customFormat: "yyyy-MM-dd HH:mm:ss")
            request.from_latitude = "\(fromLatitude ?? 0.0)"
            request.from_longitude = "\(fromLongtude ?? 0.0)"
            request.to_latitude = "\(toLatitude ?? 0.0)"
            request.to_longitude = "\(toLongtude ?? 0.0)"
            request.other_service_cost = "\(UserDefaults.standard.integer(forKey: "other_service_cost"))"
            if (currentDate ?? Date()) < Date(){
                self.showAlertError(message: "تاريخ التوصيل خاطئ")
            }else {
                RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                    self.showAlertSuccess(message: obj.message ?? "")
                }
            }
            break
        }
    }
    
}
extension OrderServicesViewController{
    func setupView(){
        switch pagetype{
        case .service:
            lblOrdersDeliveryCost.text = "\(UserDefaults.standard.integer(forKey: "request_service_cost")) ريال"
            break
        case .car:
            orderLbl.text = "الى أين تريد الذهاب؟"
            btnTime.setTitle("نوع السيارة", for: .normal)
            imgTime.image = "ic_car".image_
            lblOrdersDeliveryCost.text = "\(UserDefaults.standard.integer(forKey: "request_car_cost")) ريال"
            picBtn.isHidden = true
            orderDetailsLbl.placeholder = "اكتب أين تريد الذهاب"
            orderStack.isHidden = true
            break
            
        case .order:
            lblOrdersDeliveryCost.text = "\(UserDefaults.standard.integer(forKey: "orders_delivery_cost")) ريال"
        case .other:
            lblOrdersDeliveryCost.text = "\(UserDefaults.standard.integer(forKey: "other_service_cost")) ريال"
        }
    }
    func fetchData(){
        switch pagetype{
        case .service:
            break
        case .car:
            let request = getCarsRequest()
            RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (obj) in
                self.cars = obj.cars
                for car in obj.cars{
                    self.carsName.append(car.name ?? "")
                }
            }
            break
        case .order:
            break
        case .other:
            break
        }
    }
}
extension OrderServicesViewController: MapViewControllerDelegate{
    func mapViewControllerResponse(fromLat: Double,fromLong: Double, toLat: Double,toLong: Double,address: String) {
        if fromOrTo == true{
            self.fromLatitude = fromLat
            self.fromLongtude = fromLong
            lblFromLoc.text = address
        }else{
            self.toLatitude = toLat
            self.toLongtude = toLong
            lblToLoc.text = address
        }
    }
}
