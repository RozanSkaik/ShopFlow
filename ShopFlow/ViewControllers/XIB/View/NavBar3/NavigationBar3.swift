//
//  NavigationBar3.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 10/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit

class NavigationBar3: UIView {
    
    @IBOutlet weak var view: UIView!
    
    override func draw(_ rect: CGRect) {
        Bundle.main.loadNibNamed("NavigationBar3", owner: self, options: nil)
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
    @IBAction func btnBack(_ sender: Any) {
        parentViewController?.navigationController?.popViewController(animated: true)
    }
}
