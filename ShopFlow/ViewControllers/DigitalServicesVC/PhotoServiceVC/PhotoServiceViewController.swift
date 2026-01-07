//
//  PhotoServiceViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class PhotoServiceViewController: UIViewController {
    
    @IBOutlet weak var cornerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
}
extension PhotoServiceViewController{
    func setupView(){
        cornerView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
    }
}
