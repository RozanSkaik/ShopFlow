//
//  ViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/4/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import BEMCheckBox

class LoginViewController: UIViewController {
    
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var rememberChB: BEMCheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @IBAction func BtnIsShowPass(_ sender: Any) {
        txtPassword.isSecureTextEntry = !txtPassword.isSecureTextEntry
    }
    @IBAction func loginBtn(_ sender: Any) {
        fetchData()
    }
    
    @IBAction func signUp(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        vc.pagetype = .signUp
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func forgetPassBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension LoginViewController{
    func setupView(){
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        cornerView.roundCorners(corners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 30)
        rememberChB.delegate = self
        
    }
    func fetchData(){
        let request = LoginRequset(.login)
        request.email = txtEmail.text
        request.password = txtPassword.text
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
            UserProfile.shared.accessToken = obj.user?.accessToken ?? ""
            UserProfile.shared.profile = obj.user
        }
    }
}
extension LoginViewController: BEMCheckBoxDelegate{
    func didTap(_ checkBox: BEMCheckBox) {
        if rememberChB.on == true{
            UserProfile.shared.isRemember = true
        }else{
            UserProfile.shared.isRemember = false
        }
    }
}
