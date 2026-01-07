//
//  ResetPasswordViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    

    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendBtn(_ sender: Any) {
        let request = LoginRequset(.resetPassword)
        request.email = email.text
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            self.showAlertSuccess(message: obj.message ?? "")
        }
//       let vc = self.storyboard?.instantiateViewController(withIdentifier: "CodeVerfiyViewController") as! CodeVerfiyViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension ResetPasswordViewController{
    func setupView(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
}
