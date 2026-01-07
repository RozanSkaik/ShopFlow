//
//  OfferViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class OfferViewController: UIViewController {
    
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var offerTabeView: GeneralTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    @IBAction func btnSearch(_ sender: Any) {
        let request = SearchOfferRequest()
        request.text = txtSearch.text
        self.offerTabeView.clearData()
        self.offerTabeView.withIdentifier(identifier: "OffersTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.viewOffers
        }.buildRequest()
    }
    
}
extension OfferViewController{
    func setupView(){
        offerTabeView.register(UINib(nibName: "OffersTableViewCell", bundle: nil), forCellReuseIdentifier: "OffersTableViewCell")
    }
    func setupData(){
        self.offerTabeView.isShowPullToRefresh = true
        self.offerTabeView.setupTableView()
        self.offerTabeView.generalRowHeight  = 130
        let request = OfferRequest()
        self.offerTabeView.withIdentifier(identifier: "OffersTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.viewOffers
        }.buildRequest()
        
    }
}
