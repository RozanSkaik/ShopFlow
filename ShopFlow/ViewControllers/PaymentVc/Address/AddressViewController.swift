//
//  AddressViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/26/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet weak var addressTableView: GeneralTableView!
    var delegate: AddressViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    @IBAction func backBtn(_ sender: Any) {
           self.navigationController?.popViewController(animated: true)
       }
    
    @IBAction func addAddressBtn(_ sender: Any) {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
        vc.pagetype = .add
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension AddressViewController{
    func setupView(){
        addressTableView.register(UINib(nibName: "PaymentTableViewCell", bundle: nil), forCellReuseIdentifier: "PaymentTableViewCell")
    }
    func fetchData(){
        self.addressTableView.clearData()
        let request = AddressRequest(.getAddress)
        self.addressTableView.withIdentifier(identifier: "PaymentTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            return obj.myAddress
        }.buildRequest()
    }
}
protocol AddressViewControllerDelegate{
    func AddressControllerResponse(address: String, address_id: Int)
}
