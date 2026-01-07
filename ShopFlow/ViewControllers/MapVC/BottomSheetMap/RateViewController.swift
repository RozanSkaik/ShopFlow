//
//  RateViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/20/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {

    @IBOutlet weak var doneBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

}
extension RateViewController{
    func setupView(){
        doneBtn.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 15)
    }
}
