//
//  FreeDeleviryViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class FreeDeleviryViewController: UIViewController {
        
    @IBOutlet weak var nav: NavigationWithTitle!
    @IBOutlet weak var freeDeleviryTableView: GeneralTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.nav.title = "توصيل مجاني"
        }
    }
 
}
extension FreeDeleviryViewController{
    func setupView(){
        freeDeleviryTableView.register(UINib(nibName: "FreeDelievaryTableViewCell", bundle: nil), forCellReuseIdentifier: "FreeDelievaryTableViewCell")
    }
    func setupData(){
        let request = StoresFreeDeliveryRequest()
       
        self.freeDeleviryTableView.withIdentifier(identifier: "FreeDelievaryTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.storesFreeDelivery
        }.buildRequest()
        
    }
}
