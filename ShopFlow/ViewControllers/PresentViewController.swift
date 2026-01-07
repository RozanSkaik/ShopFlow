//
//  PresentViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func chooseBtn(_ sender: Any) {
    }
    
    @IBAction func dismissBtn(_ sender: Any) {
    }
}
extension PresentViewController{
    func setupView(){
        yesBtn.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 15)
        noBtn.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 15)
    }
}
