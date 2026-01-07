//
//  MapViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import SwiftLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    var fromLat: Double?
    var fromLong: Double?
    var toLat: Double?
    var toLong: Double?
    var address: String?
    var isFromLoc: Bool?
    let marker = GMSMarker()
    var delegate: MapViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnSelectLoc(_ sender: Any) {
        if isFromLoc == true{
            getAddress(Latitude: self.fromLat ?? 0.0, Longitude: self.fromLong ?? 0.0)
        }else{
            getAddress(Latitude: self.toLat ?? 0.0, Longitude: self.toLong ?? 0.0)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
extension MapViewController{
    func setupView(){
        let markerView = UIImageView(image: "marker".image_)
        marker.iconView = markerView
        marker.map = mapView
    }
    func setupData(){
        mapView.delegate = self
        LocationManager.shared.locateFromGPS(.continous, accuracy: .city) { result in
            switch result {
            case .failure(let error):
                debugPrint("Received error: \(error)")
            case .success(let location):
                debugPrint("Location received: \(location)")
                if self.isFromLoc == true{
                    self.fromLat = location.coordinate.latitude
                    self.fromLong = location.coordinate.longitude
                    
                    self.marker.position = CLLocationCoordinate2D(latitude: self.fromLat ?? 0.0, longitude: self.fromLong ?? 0.0)
                }else{
                    self.toLat = location.coordinate.latitude
                    self.toLong = location.coordinate.longitude
                    
                    self.marker.position = CLLocationCoordinate2D(latitude: self.toLat ?? 0.0, longitude: self.toLong ?? 0.0)
                }
                self.marker.title = "Current Location"
                self.marker.map = self.mapView
                let locValue:CLLocationCoordinate2D = location.coordinate
                self.mapView.animate(toLocation: CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude))
                self.mapView.setMinZoom(4.6, maxZoom: 20)
                self.mapView.animate(toZoom: 10)
                
            }
        }
    }
    func getAddress(Latitude: Double, Longitude: Double){
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
                    self.address = ""
                    let pm = placemarks![0]
                    self.address = "\(pm.country ?? "غير معروف")"
                    if self.isFromLoc == true{
                        self.delegate?.mapViewControllerResponse(fromLat: self.fromLat ?? 0.0, fromLong: self.fromLong ?? 0.0,toLat: 0.0,toLong: 0.0, address: self.address ?? "")
                    }else{
                        self.delegate?.mapViewControllerResponse(fromLat: 0.0, fromLong: 0.0,toLat: self.toLat ?? 0.0,toLong: self.toLong ?? 0.0, address: self.address ?? "")
                    }
                }
        })
        
    }
}
extension MapViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapView.animate(toLocation: marker.position)
        mapView.selectedMarker = marker
        return true
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.marker.position = CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude)
        if self.isFromLoc == true{
            self.fromLat = position.target.latitude
            self.fromLong = position.target.longitude
        }else{
            self.toLat = position.target.latitude
            self.toLong = position.target.longitude
        }
    }
    
}
protocol MapViewControllerDelegate{
    func mapViewControllerResponse(fromLat: Double,fromLong: Double, toLat: Double,toLong: Double,address: String)
}
