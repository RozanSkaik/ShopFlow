//
//  NavigationBar.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 10/11/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class NavigationBar: UIView {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblCartCount: UILabel!
    var fromLatitude: Double?
    var fromLongtude: Double?
    var address: String = "حدد موقعك"
    
    override func draw(_ rect: CGRect) {
        Bundle.main.loadNibNamed("NavigationBar", owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        // next: append the container to our view
        addSubview(view)
        NSLayoutConstraint.activate(
            [
                view.topAnchor.constraint(equalTo: topAnchor),
                view.leadingAnchor.constraint(equalTo: leadingAnchor),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor),
            ]
        )
        if UserDefaults.standard.string(forKey: "Address") != nil{
            lblLocation.text = UserDefaults.standard.string(forKey: "Address")
        }else{
            lblLocation.text = address
        }
    }
    @IBAction func btnCart(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CartsViewController") as! CartsViewController
        if let parentVC = self.parentViewController as? HomeViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func btnFavorite(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        if let parentVC = self.parentViewController as? HomeViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func btnOpenMap(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.isFromLoc = true
        vc.delegate = self
        if let parentVC = self.parentViewController as? HomeViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
}
extension NavigationBar: MapViewControllerDelegate{
    func mapViewControllerResponse(fromLat: Double,fromLong: Double, toLat: Double,toLong: Double,address: String) {
        self.fromLatitude = fromLat
        self.fromLongtude = fromLong
        lblLocation.text = address
        UserDefaults.standard.set(address, forKey: "Address")
    }
}
