//
//  NavigationBar2.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 10/12/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class NavigationBar2: UIView {
    @IBOutlet weak var view: UIView!
    
    override func draw(_ rect: CGRect) {
        Bundle.main.loadNibNamed("NavigationBar2", owner: self, options: nil)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        NSLayoutConstraint.activate(
           [
              view.topAnchor.constraint(equalTo: topAnchor),
              view.leadingAnchor.constraint(equalTo: leadingAnchor),
              view.bottomAnchor.constraint(equalTo: bottomAnchor),
              view.trailingAnchor.constraint(equalTo: trailingAnchor),
           ]
         )
        view.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
    }
    
    @IBAction func btnFavorite(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "FavoriteViewController") as! FavoriteViewController
        if let parentVC = self.parentViewController as? ProfileViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }else if let parentVC = self.parentViewController as? CategoriesViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }else if let parentVC = self.parentViewController as? MyOrdersViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func btnCart(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "CartsViewController") as! CartsViewController
        if let parentVC = self.parentViewController as? ProfileViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }else if let parentVC = self.parentViewController as? CategoriesViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }else if let parentVC = self.parentViewController as? MyOrdersViewController{
            parentVC.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
