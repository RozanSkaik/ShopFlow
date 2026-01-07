//
//  WelcomeMapViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/19/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import CTSlidingUpPanel
import Presentr

class WelcomeMapViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var bottomView: UIView!
    
    var bottomController: CTBottomSlideController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //addBottomSheetView()
    }
//
    @IBAction func rateBtn(_ sender: Any) {
        let presenter = Presentr(presentationType: .popup)
        presenter.viewControllerForContext = self
        presenter.dismissOnSwipe = true
        presenter.dismissOnSwipeDirection = .bottom
        let controller = storyboard?.instantiateViewController(withIdentifier: "RateViewController") as! RateViewController
        customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension WelcomeMapViewController{
    func setupView(){
        let camera = GMSCameraPosition.camera(withLatitude: 21.4858, longitude: 39.1925, zoom: 12.0)
        let marker = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: 21.4858, longitude: 39.1925)
        marker.title = "Jeddah"
        marker.snippet = "Saudi Arabia"
        mapView.camera = camera
        let markerView = UIImageView(image: "marker".image_)
        marker.iconView = markerView
        marker.map = mapView
        bottomController?.delegate = self
        bottomController?.setSlideEnabled(true)
        bottomController = CTBottomSlideController(parent: view, bottomView: bottomView,
                                                   tabController: self.tabBarController,
                        navController: self.navigationController, visibleHeight: 200)
        bottomView.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 25)
        bottomController?.setAnchorPoint(anchor: 0.7)
    }
   
}
extension WelcomeMapViewController: CTBottomSlideDelegate{
    func didPanelCollapse() {
        
    }
    
    func didPanelExpand() {
        
    }
    
    func didPanelAnchor() {
        
    }
    
    func didPanelMove(panelOffset: CGFloat) {
        
    }
    
    
}
