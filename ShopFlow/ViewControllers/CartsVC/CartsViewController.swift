//
//  CartsViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import BEMCheckBox

class CartsViewController: UIViewController {
    
    @IBOutlet weak var nav: NavigationWithTitle!
    @IBOutlet weak var cartsTableCart: GeneralTableView!
    @IBOutlet weak var txtCopuns: UITextField!
    @IBOutlet weak var tableHieght: NSLayoutConstraint!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var lblDeliveryCost: UILabel!
    @IBOutlet weak var lblVatAmount: UILabel!
    @IBOutlet weak var lblDiscountCopon: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var chbDelivery: BEMCheckBox!
    @IBOutlet weak var chbPickup: BEMCheckBox!
    @IBOutlet weak var stackDelivery: UIStackView!
    @IBOutlet weak var chb2Cash: BEMCheckBox!
    @IBOutlet weak var chb2Card: BEMCheckBox!
    @IBOutlet weak var chb2Wallet: BEMCheckBox!
    
    var delivery_method: Int = 0
    var group: BEMCheckBoxGroup = BEMCheckBoxGroup()
    var group2: BEMCheckBoxGroup = BEMCheckBoxGroup()
    var address_id: Int?
    var payment_method: PaymentMethod?
    enum PaymentMethod: String{
        case wallet = "wallet"
        case card = "card"
        case cash = "cash"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.nav.title = "سلة المشتريات"
        }
        fetchData()
    }
    
    @IBAction func btnAddresses(_ sender: Any) {
        if let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddressViewController") as? AddressViewController{
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func btnCheckCopuns(_ sender: Any) {
        refreshData()
    }
    @IBAction func btnOrder(_ sender: Any) {
        checkout()
    }
}
extension CartsViewController{
    func setupView(){
        cartsTableCart.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
        cartsTableCart.generalRowHeight  = 125
        cartsTableCart.showEmptyDataSet = true
        cartsTableCart.EmptyDataTitle = "لا يوجد منتجات مضافة الى السلة"
        group = BEMCheckBoxGroup(checkBoxes: [chbDelivery, chbPickup])
        group.selectedCheckBox = chbDelivery
        group.mustHaveSelection = true
        group2 = BEMCheckBoxGroup(checkBoxes: [chb2Cash, chb2Card,chb2Wallet])
        chbDelivery.delegate = self
        chbPickup.delegate = self
        chb2Cash.delegate = self
        chb2Card.delegate = self
        chb2Wallet.delegate = self
    }
    func fetchData(){
        let request = CartRequest()
        request.delivery_method = delivery_method
        request.coupon = txtCopuns.text
        request.user_address_id = address_id
        request.payment_method = payment_method?.rawValue
        self.cartsTableCart.clearData()
        self.cartsTableCart.withIdentifier(identifier: "CartTableViewCell").withRequest(request: request).parsingObjectFunc { (obj) -> [Any] in
            if obj.carts.count != 0 {
                self.tableHieght.constant = (self.cartsTableCart.generalRowHeight ?? 0) * CGFloat(obj.carts.count)
            }
            self.lblSubTotal.text = "\(obj.sub_total ?? 0) ريال"
            self.lblDeliveryCost.text = "\(obj.delivery_cost ?? 0) ريال"
            self.lblVatAmount.text = "\(obj.vat_amount ?? "") ريال"
            self.lblDiscountCopon.text = "\(obj.coupon_amount ?? "") ريال"
            self.lblTotal.text = "\(obj.final_total ?? "") ريال"
            return obj.carts
        }.buildRequest()
        
        
    }
    func refreshData(){
        let request = CartRequest()
        request.delivery_method = delivery_method
        request.coupon = txtCopuns.text
        request.user_address_id = address_id
        request.payment_method = payment_method?.rawValue
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.lblSubTotal.text = "\(obj.sub_total ?? 0) ريال"
            self.lblDeliveryCost.text = "\(obj.delivery_cost ?? 0) ريال"
            self.lblVatAmount.text = "\(obj.vat_amount ?? "") ريال"
            self.lblDiscountCopon.text = "\(obj.coupon_amount ?? "") ريال"
            self.lblTotal.text = "\(obj.final_total ?? "") ريال"
        }
    }
    func checkout(){
        let request = CheckOutRequest()
        request.delivery_method = delivery_method
        request.coupon = txtCopuns.text
        request.user_address_id = address_id
        request.payment_method = payment_method?.rawValue
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            self.lblSubTotal.text = "\(obj.order?.subTotal ?? 0) ريال"
            self.lblDeliveryCost.text = "\(obj.order?.deliveryCost ?? 0) ريال"
            self.lblVatAmount.text = "\(obj.order?.vatAmount ?? "") ريال"
            self.lblDiscountCopon.text = "\(obj.order?.couponAmount ?? "") ريال"
            self.lblTotal.text = "\(obj.order?.finalTotal ?? "") ريال"
            self.showAlertSuccessWithAction(message: obj.message ?? "") {
                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OrderPathViewController") as! OrderPathViewController
                vc.orderId = obj.order?.id
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
extension CartsViewController: AddressViewControllerDelegate{
    func AddressControllerResponse(address: String, address_id: Int) {
        lblAddress.text = address
        self.address_id = address_id
    }
}
extension CartsViewController: BEMCheckBoxDelegate{
    func didTap(_ checkBox: BEMCheckBox) {
        if checkBox == chbDelivery, checkBox.on{
            self.delivery_method = 1
            self.stackDelivery.isHidden = false
            refreshData()
        }else if checkBox == chbPickup, checkBox.on{
            self.delivery_method = 0
            self.stackDelivery.isHidden = true
            refreshData()
        }else if checkBox == chb2Cash, checkBox.on{
            payment_method = .cash
        }else if checkBox == chb2Card,checkBox.on{
            payment_method = .card
        }else if checkBox == chb2Wallet, checkBox.on{
            payment_method = .wallet
        }
    }
}
