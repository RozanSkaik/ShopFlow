//
//  CodeVerfiyViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/6/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class CodeVerfiyViewController: UIViewController {
    
    @IBOutlet weak var txtCode: UITextField!
    
    var mobile: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func confimCodeBtn(_ sender: Any) {
        fetchData()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension CodeVerfiyViewController{
    func setupView(){
        
    }
    func fetchData(){
        let request = LoginRequset(.checkCode)
        request.mobile = mobile
        request.code = txtCode.text
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request, showLoader: true, showErrorMessage: true) { (obj) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
            AppDelegate.shared.rootNavigationViewController.setViewControllers([vc], animated: true)
            
        }
    }
}

