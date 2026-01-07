//
//  CopounsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class CopounsViewController: UIViewController {

    @IBOutlet weak var copounsTableView: GeneralTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchData()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension CopounsViewController{
    func setupView(){
        self.copounsTableView.register(UINib(nibName: "PaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentTableViewCell")
        copounsTableView.showEmptyDataSet = true
        copounsTableView.EmptyDataTitle = "لا يوجد كوبونات"
    }
    func fetchData(){
        let request = getMyCopounsRequest()
        self.copounsTableView.withIdentifier(identifier: "PaymentTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.myCopouns
        }.buildRequest()
    }
}
