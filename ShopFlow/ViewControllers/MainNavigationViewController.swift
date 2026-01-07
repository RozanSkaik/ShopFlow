//
//  MainNavigationViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import CoreLocation

class MainNavigationViewController: UINavigationController {
    
    private var alwaysPoppableDelegate: AlwaysPoppableDelegate!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
        setupCustomBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension MainNavigationViewController {
    
    func setupView() {
        self.alwaysPoppableDelegate = AlwaysPoppableDelegate(navigationController: self, originalDelegate: self.interactivePopGestureRecognizer!.delegate!)
        self.interactivePopGestureRecognizer!.delegate = self.alwaysPoppableDelegate
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
        
        AppDelegate.shared.rootNavigationViewController = self
        
        if UserProfile.shared.isUserLogin(){
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        } else {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }
    }
    
    func fetchData() {
        // if !UserProfile.shared.isUserLogin() {
        let request = ConstantsRequest()
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (obj) in
            UserProfile.shared.activities = obj.constants?.activities
            UserProfile.shared.categories = obj.constants?.categories
            UserProfile.shared.ads = obj.constants?.ads
            UserDefaults.standard.set(obj.constants?.orders_delivery_cost, forKey: "orders_delivery_cost")
            UserDefaults.standard.set(obj.constants?.request_car_cost, forKey: "request_car_cost")
            UserDefaults.standard.set(obj.constants?.request_service_cost, forKey: "request_service_cost")
            UserDefaults.standard.set(obj.constants?.other_service_cost, forKey: "other_service_cost")

        }
        let adsRequest = AdsRequest()
        RequestBuilder.requestWithSuccessfullRespnose(request: adsRequest) { (obj) in
            UserProfile.shared.slider = obj.adsImage
        }
        let offerRequest = ViewStoresRequest()
        offerRequest.id = "0"
        RequestBuilder.requestWithSuccessfullRespnose(request: offerRequest) { (obj) in
            UserProfile.shared.offer = obj.offer
        }
        let categoryRequest = HomePageCategoriesRequest()
        RequestBuilder.requestWithSuccessfullRespnose(request: categoryRequest) { (obj) in
            UserProfile.shared.homePageCategories = obj.homePageCategories
            UserProfile.shared.ShopFlowProducts = obj.shopFlowProducts
        }
        let nearStoreRequest = NearbyStoresRequest()
        nearStoreRequest.latitude = UserDefaults.standard.double(forKey: "latitude")
        nearStoreRequest.longitude = UserDefaults.standard.double(forKey: "longitude")
        RequestBuilder.requestWithSuccessfullRespnose(request: nearStoreRequest) { (obj) in
            if obj.viewStores.count > 0 {
                UserProfile.shared.viewStore = obj.viewStores[0]
            }
        }
        let userRequest = ProfileRequest()
        RequestBuilder.requestWithSuccessfullRespnose(request: userRequest, showLoader: true, showErrorMessage: true) { (obj) in
            UserProfile.shared.profile = obj.user
        }
        // }
        
        locationManager.requestWhenInUseAuthorization()
        var currentLoc: CLLocation?
        if(CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways) {
            currentLoc = locationManager.location
            UserDefaults.standard.set(currentLoc?.coordinate.latitude, forKey: "latitude")
            UserDefaults.standard.set(currentLoc?.coordinate.longitude, forKey: "longitude")
        }
    }
    func setupCustomBackButton()  {
        let BarButtonItemAppearance = UIBarButtonItem.appearance()
        BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)

        let navigationBarAppearance = UINavigationBar.appearance()
        let backButtonImage = "ic_back".image_

        if #available(iOS 13.0, *) {
            
            let fancyAppearance = UINavigationBarAppearance()
            fancyAppearance.configureWithDefaultBackground()
            fancyAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            
            let lineAppearance = UINavigationBarAppearance()
            lineAppearance.configureWithDefaultBackground()
            lineAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        
            navigationBarAppearance.scrollEdgeAppearance = fancyAppearance
            navigationBarAppearance.compactAppearance = lineAppearance
            navigationBarAppearance.standardAppearance = lineAppearance
        } else {
            navigationBarAppearance.backIndicatorImage = backButtonImage
            navigationBarAppearance.backIndicatorTransitionMaskImage = backButtonImage
        }
    }
}



private class AlwaysPoppableDelegate : NSObject, UIGestureRecognizerDelegate {
    
    weak var navigationController: MainNavigationViewController?
    weak var originalDelegate: UIGestureRecognizerDelegate?
    
    init(navigationController: MainNavigationViewController, originalDelegate: UIGestureRecognizerDelegate) {
        self.navigationController = navigationController
        self.originalDelegate = originalDelegate
        self.navigationController?.navigationBar.semanticContentAttribute = .forceRightToLeft
    }
    
    
    // For handling iOS before 13.4
    @objc func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let navigationController = navigationController, navigationController.isNavigationBarHidden && navigationController.viewControllers.count > 1 {
            return true
        }
        else if let originalDelegate = originalDelegate {
            return originalDelegate.gestureRecognizer!(gestureRecognizer, shouldReceive: touch)
        }
        else {
            return false
        }
    }
    
    // For handling iOS 13.4+
    @objc func _gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceiveEvent event: UIEvent) -> Bool {
        if let navigationController = navigationController, navigationController.isNavigationBarHidden && navigationController.viewControllers.count > 1 {
            return true
        }
        else if let originalDelegate = originalDelegate {
            let selector = #selector(_gestureRecognizer(_:shouldReceiveEvent:))
            if originalDelegate.responds(to: selector) {
                let result = originalDelegate.perform(selector, with: gestureRecognizer, with: event)
                return result != nil
            }
        }
        
        return false
    }
    
    override func responds(to aSelector: Selector) -> Bool {
        if #available(iOS 13.4, *) {
            return originalDelegate?.responds(to: aSelector) ?? false
        }
        else {
            if aSelector == #selector(gestureRecognizer(_:shouldReceive:)) {
                return true
            }
            else {
                return originalDelegate?.responds(to: aSelector) ?? false
            }
        }
    }
    
    override func forwardingTarget(for aSelector: Selector) -> Any? {
        if #available(iOS 13.4, *), aSelector == #selector(_gestureRecognizer(_:shouldReceiveEvent:)) {
            return nil
        }
        else {
            return self.originalDelegate
        }
    }
}
