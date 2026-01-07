//
//  AddCardViewController.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/2/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

enum pageType{
    case add
    case edit
}
class AddCardViewController: UIViewController {
    
    @IBOutlet weak var nav: NavigationWithTitle!
    @IBOutlet weak var txtCardNo: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtExpiredDate: UITextField!
    @IBOutlet weak var txtCVV: UITextField!
    
    var cardId: Int?
    var cardObj: Cards?
    var pagetype: pageType = .add
    var navTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async {
            self.nav.title = self.navTitle ?? ""
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        switch pagetype{
        case .add:
            let request = addPaymentCardRequest()
            request.method_id = "\(cardId ?? 0)"
            request.card_number = txtCardNo.text
            request.name_cardholder = txtFullName.text
            request.expired_date = txtExpiredDate.text
            request.validation_number = txtCVV.text
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                self.showAlertPopUp(title: "تنبيه", message: obj.message ?? "", action1: {
                    if obj.success == true{
                        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderPathViewController"){
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                }) {
                    
                }
            }
            break
        case .edit:
            let request = EditPaymentCardRequest()
            request.card_id = "\(cardObj?.id ?? 0)"
            request.method_id = "\(cardObj?.methodId ?? 0)"
            request.card_number = txtCardNo.text
            request.name_cardholder = txtFullName.text
            request.expired_date = txtExpiredDate.text
            request.validation_number = txtCVV.text
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                self.showAlertSuccess(message: obj.message ?? "")
            }
        }
        
    }
}
extension AddCardViewController{
    func setupView(){
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        txtExpiredDate.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        switch pagetype{
        case .add:
            self.navTitle = "إضافة بطاقة دفع"
            break
        case .edit:
            self.navTitle = "تعديل بطاقة الدفع"
            self.txtCardNo.text = self.cardObj?.cardNumber
            self.txtFullName.text = self.cardObj?.nameCardholder
            self.txtExpiredDate.text = self.cardObj?.expiredDate
            self.txtCVV.text = "\(self.cardObj?.validationNumber ?? 0)"
            break
        }
    }
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        txtExpiredDate.text = dateFormatter.string(from: sender.date)
    }
}
