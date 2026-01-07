//
//  AddAddressViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/23/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import SwiftLocation
import JVFloatLabeledTextField

class AddAddressViewController: UIViewController {
    
    @IBOutlet weak var txtAddress: JVFloatLabeledTextView!
    @IBOutlet weak var mapView: GMSMapView!
    
    var lat: Double?
    var long: Double?
    var address: String?
    let marker = GMSMarker()
    var addressObj: Addresses?
    var pagetype: pageType = .add
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
        }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddAddress(_ sender: Any) {
        switch pagetype{
        case .add:
            let request = AddressRequest(.addAddress)
            request.address = txtAddress.text
            request.latitude = "\(self.lat ?? 0.0)"
            request.longitude = "\(self.long ?? 0.0)"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                self.showAlertSuccessWithAction(message: obj.message ?? "") {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            break
        case .edit:
            let request = AddressRequest(.editAddress)
            request.address_id = "\(addressObj?.id ?? 0)"
            request.address = txtAddress.text
            request.latitude = "\(self.lat ?? 0.0)"
            request.longitude = "\(self.long ?? 0.0)"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                self.showAlertSuccessWithAction(message: obj.message ?? "") {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            break
        }
        
    }
}
extension AddAddressViewController{
    func setupView(){
        let markerView = UIImageView(image: "marker".image_)
        marker.iconView = markerView
        marker.map = mapView
        switch pagetype{
        case .add:
            break
        case .edit:
            self.txtAddress.text = self.addressObj?.address
            self.lat = Double(self.addressObj?.latitude ?? "")
            self.long = Double(self.addressObj?.longitude ?? "")
            break
        }
    }
    func setupData(){
    mapView.delegate = self
    LocationManager.shared.locateFromGPS(.continous, accuracy: .city) { result in
        switch result {
        case .failure(let error):
            debugPrint("Received error: \(error)")
        case .success(let location):
            debugPrint("Location received: \(location)")
            self.lat = location.coordinate.latitude
            self.long = location.coordinate.longitude
            self.marker.position = CLLocationCoordinate2D(latitude: self.lat ?? 0.0, longitude: self.long ?? 0.0)
            self.marker.map = self.mapView
            let locValue:CLLocationCoordinate2D = location.coordinate
            self.mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude))
            self.mapView.setMinZoom(4.6, maxZoom: 20)
            self.mapView.animate(toZoom: 10)
            
        }
    }
}
}
extension AddAddressViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapView.animate(toLocation: marker.position)
        mapView.selectedMarker = marker
        return true
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.marker.position = CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude)
            self.lat = position.target.latitude
            self.long = position.target.longitude
        
    }
    
}
