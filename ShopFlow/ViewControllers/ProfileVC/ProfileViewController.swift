//
//  ProfileViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/11/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var footCornerView: UIView!
    @IBOutlet weak var lblWalletAmount: UILabel!
    @IBOutlet weak var lblCardCount: UILabel!
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    @IBAction func editProfileBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        vc.pagetype = .editProfile
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            vc.imgProfile.image = self.imgProfile.image
            vc.txtName.text = self.lblName.text
            vc.txtEmail.text = self.email
            vc.txtMobile.text = self.lblMobile.text
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func switchOrder(_ sender: UISwitch) {
        let request = ChangeNotifiStatusRequest()
        if sender.isOn == true{
            request.status = 1
        }else{
            request.status = 0
        }
        request.notification = "orders"
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.showAlertSuccess(message: obj.message ?? "")
        }
    }
    @IBAction func switchStore(_ sender: UISwitch) {
        let request = ChangeNotifiStatusRequest()
        if sender.isOn == true{
            request.status = 1
        }else{
            request.status = 0
        }
        request.notification = "stores"
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.showAlertSuccess(message: obj.message ?? "")
        }
    }
    @IBAction func switchOffer(_ sender: UISwitch) {
        let request = ChangeNotifiStatusRequest()
        if sender.isOn == true{
            request.status = 1
        }else{
            request.status = 0
        }
        request.notification = "offers"
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.showAlertSuccess(message: obj.message ?? "")
        }
    }
    @IBAction func settingsBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func logout(_ sender: Any) {
        let request = LoginRequset(.logout)
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
            self.showAlertSuccess(message: obj.message ?? "")
            UserDefaults.standard.set(false, forKey: "remember")
            
        }
    }
    
}
extension ProfileViewController{
    func setupView(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        footCornerView.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 50)
    }
    func setupData(){
        let obj = UserProfile.shared.profile
        self.imgProfile.LoadImageFromUrl(url: obj?.imageProfile ?? "")
        self.lblName.text = obj?.name
        self.lblMobile.text = obj?.mobile
        self.lblCardCount.text = "\(obj?.paymentCardsCount ?? 0)"
        self.lblWalletAmount.text = "\(obj?.walletAmount ?? 0)"
        self.email = obj?.email
    }
    func fetchData(){
        let request = ProfileRequest()
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            self.imgProfile.LoadImageFromUrl(url: obj.user?.imageProfile ?? "")
            self.lblName.text = obj.user?.name
            self.lblMobile.text = obj.user?.mobile
            self.lblCardCount.text = "\(obj.user?.paymentCardsCount ?? 0)"
            self.lblWalletAmount.text = "\(obj.user?.walletAmount ?? 0)"
            self.email = obj.user?.email
            
        }
    }
    
}
