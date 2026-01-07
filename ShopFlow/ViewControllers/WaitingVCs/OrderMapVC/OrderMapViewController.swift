//
//  OrderMapViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/16/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class OrderMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension OrderMapViewController{
    func setupView(){
        let camera = GMSCameraPosition.camera(withLatitude: 21.4858, longitude: 39.1925, zoom: 12.0)
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: 21.4858, longitude: 39.1925)
        marker.title = "محمد أحمد حسن"
        marker.snippet = "محمد أحمد حسن"
        mapView.camera = camera
        let markerView = UIImageView(image: "ic_markercar".image_)
        marker.iconView = markerView
        marker.map = mapView
    }
}
