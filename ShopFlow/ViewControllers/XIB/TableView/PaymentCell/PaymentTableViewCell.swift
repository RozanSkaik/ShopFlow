//
//  PaymentTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/20/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class PaymentTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var imgPayment: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var stackDateExpired: UIStackView!
    @IBOutlet weak var lblDate: UILabel!
    
    var id: Int?
    var card: Cards?
    var address: Addresses?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configureCell() {
        if let obj = self.object?.object as? ConstantsCategory{
            self.id = obj.id
            self.imgPayment.LoadImageFromUrl(url: obj.image)
            self.lblName.text = obj.name
        }else if let obj = self.object?.object as? Cards{
            self.id = obj.id
            self.card = obj
            self.imgPayment.LoadImageFromUrl(url: obj.method?.image)
            self.lblName.text = obj.method?.name
            deleteBtn.isHidden = false
            editBtn.setTitle("", for: .normal)
            editBtn.setImage("ic_edit".image_, for: .normal)
        }else if let obj = self.object?.object as? Copouns{
            self.id = obj.id
            deleteBtn.isHidden = false
            self.imgPayment.isHidden = true
            self.lblName.text = obj.name
            editBtn.setTitle("خصم \(obj.discount ?? 0) %", for: .normal)
            stackDateExpired.isHidden = false
            lblDate.text = obj.end
        }else if let obj = self.object?.object as? Addresses{
            self.address = obj
            self.id = obj.id
            self.imgPayment.isHidden = true
            self.lblName.text = obj.address
            deleteBtn.isHidden = false
            editBtn.setTitle("", for: .normal)
            editBtn.setImage("ic_edit".image_, for: .normal)
        }
    }
    @IBAction func addPaymentBtn(_ sender: Any) {
        if let parent = self.parentVC as? PaymentOptionsViewController{
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddCardViewController") as! AddCardViewController
            vc.pagetype = .add
            vc.cardId = id
            parent.navigationController?.pushViewController(vc, animated: true)
        }else if let myPaymentParent = self.parentVC as? MyPaymentCardsViewController{
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddCardViewController") as! AddCardViewController
            vc.pagetype = .edit
            vc.cardObj = card
            myPaymentParent.navigationController?.pushViewController(vc, animated: true)
        }else if let addressParent = self.parentVC as? AddressViewController{
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "AddAddressViewController") as! AddAddressViewController
            vc.addressObj = address
            vc.pagetype = .edit
            addressParent.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        if let obj = self.object?.object as? Cards{
            let request = DeletePaymentCardRequest()
            request.id = "\(id ?? 0)"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                 if let parent = self.parentVC as? MyPaymentCardsViewController{
                    parent.showAlertSuccess(message: obj.message ?? "")
                    parent.MyPaymentTableView.reloadData()
                }
            }
            self.tableView?.objects.remove(at: indexPath.row)
        }else if let obj = self.object?.object as? Copouns{
            let request = DeleteCopounsRequest()
            request.id = "\(id ?? 0)"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                 if let parent = self.parentVC as? CopounsViewController{
                    parent.showAlertSuccess(message: obj.message ?? "")
                    parent.copounsTableView.reloadData()
                }
            }
            self.tableView?.objects.remove(at: indexPath.row)
        }else if let obj = self.object?.object as? Addresses{
            let request = AddressRequest(.deleteAddress)
            request.address_id = "\(id ?? 0)"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                 if let parent = self.parentVC as? AddressViewController{
                    parent.showAlertSuccess(message: obj.message ?? "")
                    parent.addressTableView.reloadData()
                }
            }
            self.tableView?.objects.remove(at: indexPath.row)
        }
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let addressParent = self.parentVC as? AddressViewController{
            addressParent.delegate?.AddressControllerResponse(address: self.lblName.text ?? "", address_id: id ?? 0)
            addressParent.navigationController?.popViewController(animated: true)
        }
    }
}
