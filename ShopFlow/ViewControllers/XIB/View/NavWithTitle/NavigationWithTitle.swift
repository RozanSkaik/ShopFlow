//
//  NavigationWithTitle.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 10/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class NavigationWithTitle: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func draw(_ rect: CGRect) {
        Bundle.main.loadNibNamed("NavigationWithTitle", owner: self, options: nil)
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
    var title: String = "" {
        didSet {
            lblTitle.text = title
        }
    }
    
    @IBAction func btnBack(_ sender: Any) {
        parentViewController?.navigationController?.popViewController(animated: true)
    }
}
