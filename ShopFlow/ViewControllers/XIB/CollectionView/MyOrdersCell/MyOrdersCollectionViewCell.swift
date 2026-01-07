//
//  MyOrdersCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/9/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class MyOrdersCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var imgOrder: UIImageView!
    @IBOutlet weak var lblOrderName: UILabel!
    @IBOutlet weak var lblFromLoc: UILabel!
    @IBOutlet weak var lblToLoc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblOrderNo: UILabel!
    @IBOutlet weak var lblMealNo: UILabel!
    @IBOutlet weak var lblTotalPrice: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var viewStatusColor: UIView!
    @IBOutlet weak var stackMealNo: UIStackView!
    @IBOutlet weak var imgStatus: UIImageView!
    
    @IBOutlet weak var stackCancelOrder: UIStackView!
    var status: Constants.OrderStatus = .new
    var id: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func configureCell() {
        if let obj = self.object?.object as? MyOrder{
            if obj.status == 0{
                stackCancelOrder.isHidden = false
            }else{
                stackCancelOrder.isHidden = true
            }
            if obj.orderProducts?.first?.product?.ShopFlowProduct == 1{
                stackMealNo.isHidden = true
            }else{
                stackMealNo.isHidden = false
            }
            self.id = obj.id
            imgOrder.LoadImageFromUrl(url: obj.store?.imageProfile)
            lblOrderName.text = obj.store?.name
            lblToLoc.text = obj.store?.address
            lblDate.text = obj.createdAt
            changeStatus(statusNo: obj.status ?? 0)
            lblOrderNo.text = "#\(obj.id ?? 0)"
            lblMealNo.text = "X \(obj.mealsCount ?? 0)"
            lblTotalPrice.text = "\(obj.finalTotal ?? 0.0)"
        }
    }
    
    @IBAction func btnDelete(_ sender: Any) {
        let request = CancelOrderRequest()
        request.id = self.id
        RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
            if let vc = self.parentVC as? MyOrdersViewController{
                vc.showAlertSuccessWithAction(message: obj.message ?? "") {
                    self.changeStatus(statusNo: 6)
                    self.stackCancelOrder.isHidden = true
                }
            }
        }
    }
    func changeStatus(statusNo: Int){
        lblStatus.text = status.getStatusName(statusNo: statusNo).status
        viewStatusColor.backgroundColor = status.getStatusName(statusNo: statusNo).viewColor
        lblStatus.textColor = status.getStatusName(statusNo: statusNo).nameColor
        imgStatus.image = status.getStatusName(statusNo: statusNo).statusImage
    }
}
