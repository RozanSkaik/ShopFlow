//
//  WalletViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/18/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var txtWallet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addWalletBtn(_ sender: Any) {
        let requset = ChargeWalletRequest()
        requset.amount = txtWallet.text
        RequestBuilder.requestWithSuccessfullRespnose(request: requset) { (obj) in
            self.showAlertSuccess(message: obj.message ?? "")
        }
        
    }

}
extension WalletViewController{
    func setupView(){
        cornerView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
    }
}
