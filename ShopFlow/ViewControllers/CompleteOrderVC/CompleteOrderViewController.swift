//
//  CompleteOrderViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/2/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class CompleteOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func goToHomeBtn(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController"){
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
        }
        
    }
}
