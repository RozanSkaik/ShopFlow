//
//  OrderRateViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import Presentr

class OrderRateViewController: UIViewController {

    @IBOutlet weak var topCorners: GradientView!
    
    @IBOutlet weak var bottomCorners: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    @IBAction func cancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendRate(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let presenter = Presentr(presentationType: .popup)
            let controller = self.storyboard?.instantiateViewController(withIdentifier: "SentRateViewController") as! SentRateViewController
            presenter.viewControllerForContext = controller
            presenter.dismissOnSwipe = true
            presenter.dismissOnSwipeDirection = .bottom
            
            self.customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
        }
        
    }
}

extension OrderRateViewController{
    func setupView(){
        topCorners.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 15)
        bottomCorners.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 15)
    }
}
