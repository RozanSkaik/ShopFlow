//
//  MyPaymentCardsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/13/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class MyPaymentCardsViewController: UIViewController {

    
    @IBOutlet weak var MyPaymentTableView: GeneralTableView!{
        didSet{
            MyPaymentTableView.register(UINib(nibName: "PaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentTableViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension MyPaymentCardsViewController{
    func setupView(){
        MyPaymentTableView.showEmptyDataSet = true
        MyPaymentTableView.EmptyDataTitleFont = UIFont(name: "Cairo-Bold", size: 17)!
        self.MyPaymentTableView.generalRowHeight = 60
    }
    func fetchData(){
        self.MyPaymentTableView.clearData()
            let request = getMyPaymentCardsRequest()
            self.MyPaymentTableView.withIdentifier(identifier: "PaymentTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
                return obj.myPayments
            }.buildRequest()
    }
}
