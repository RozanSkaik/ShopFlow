//
//  LoadingViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
   
    

}
extension LoadingViewController{
    func setupView() {
        
        
        indicatorView.type = .ballSpinFadeLoader
        indicatorView.color = "#24A29B".color_
        indicatorView.startAnimating()


    }
}
