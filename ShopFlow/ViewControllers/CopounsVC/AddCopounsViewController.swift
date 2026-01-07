//
//  AddCopounsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class AddCopounsViewController: UIViewController {

    @IBOutlet weak var cornerReduis: UIView!
    @IBOutlet weak var txtCopouns: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func checkBtn(_ sender: Any) {
        let requset = AddNewCopounsRequest()
        requset.coupon = txtCopouns.text
        RequestBuilder.requestWithSuccessfullRespnose(request: requset) { (obj) in
            self.showAlertSuccess(message: obj.message ?? "")
        }
    }

}
extension AddCopounsViewController{
    func setupView(){
        cornerReduis.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
    }
}
