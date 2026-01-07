//
//  CartTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class CartTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var imgCart: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblWieght: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var viewQuantity: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? Cart{
            imgCart.LoadImageFromUrl(url: obj.product?.image)
            lblProductName.text = obj.product?.name
            lblWieght.text = obj.product?.descriptionField
            lblQuantity.text = "\(obj.quantity ?? 0)"
            if obj.product?.offerPrice == nil{
                lblPrice.text = "\((obj.quantity ?? 0) * (obj.product?.price ?? 0)) ريال"
            }else{
                lblPrice.text = "\((obj.quantity ?? 0) * (obj.product?.offerPrice ?? 0)) ريال"
            }
            
            if obj.product?.isFavorite == 0{
                btnFav.setImage("favorite".image_, for: .normal)
            }else{
                btnFav.setImage("ic_fill_favorite".image_, for: .normal)
            }
        }else if let obj = self.object?.object as? ShopFlowProducts{
            imgCart.LoadImageFromUrl(url: obj.image)
            lblProductName.text = obj.name
            lblWieght.text = obj.descriptionField
            lblPrice.text = "\(obj.price ?? 0) ريال"
            btnFav.setImage("ic_fill_favorite".image_, for: .normal)
            viewQuantity.isHidden = true
        }
    }
    @IBAction func btnAddToFavorite(_ button: UIButton) {
        if let vc = self.parentVC as? CartsViewController{
            let addRequest = AddFavoriteCartRequest()
            let obj = self.object?.object as? Cart
            addRequest.id = "\(obj?.product?.id ?? 0)"
            let deleteRequest = DeleteFavoriteCartRequest()
            deleteRequest.id = "\(obj?.product?.id ?? 0)"
            if obj?.product?.isFavorite == 0{
                btnFav.setImage("ic_fill_favorite".image_, for: .normal)
                RequestBuilder.requestWithSuccessfullRespnose(request: addRequest) { (obj) in
                    vc.showAlertSuccess(message: obj.message ?? "")
                }
                obj?.product?.isFavorite = 1
            }else{
                btnFav.setImage("favorite".image_, for: .normal)
                RequestBuilder.requestWithSuccessfullRespnose(request: deleteRequest) { (obj) in
                    if let vc = self.parentVC as? CartsViewController{
                        vc.showAlertSuccess(message: obj.message ?? "")
                    }
                }
                obj?.product?.isFavorite = 0
            }
        }
    }
    @IBAction func btnIncrese(_ sender: Any) {
        let request = ChangeQuantityRequest()
        let cart = self.object?.object as? Cart
        request.product_id = "\(cart?.product?.id ?? 0)"
        request.type = "increase"
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (obj) in
            self.lblQuantity.text = "\(obj.quantity ?? 0)"
            self.lblPrice.text = "\((obj.quantity ?? 0) * (obj.price ?? 0)) ريال"
            if let parent = self.parentVC as? CartsViewController{
                parent.refreshData()
            }
        }
    }
    
    @IBAction func btnDecrese(_ sender: Any) {
        let request = ChangeQuantityRequest()
        let cart = self.object?.object as? Cart
        request.product_id = "\(cart?.product?.id ?? 0)"
        request.type = "decrease"
        
        RequestBuilder.requestWithSuccessfullRespnose(request: request,showLoader: false) { (obj) in
            self.lblQuantity.text = "\(obj.quantity ?? 0)"
            self.lblPrice.text = "\((obj.quantity ?? 0) * (obj.price ?? 0)) ريال"
            if let parent = self.parentVC as? CartsViewController{
                parent.refreshData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if let vc = self.parentVC as? CartsViewController{
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
        -> UISwipeActionsConfiguration? {
            if let vc = self.parentVC as? CartsViewController{
                let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
                    //                tableView.deleteRows(at: [indexPath], with: .fade)
                    self.tableView?.objects.remove(at: indexPath.row)
                    let request = DeleteCartRequest()
                    let obj = self.object?.object as? Cart
                    request.id = "\(obj?.product?.id ?? 0)"
                    RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                        if let vc = self.parentVC as? CartsViewController{
                            vc.showAlertSuccess(message: obj.message ?? "")
                            vc.cartsTableCart.reloadData()
                            vc.tableHieght.constant -= vc.cartsTableCart.generalHeaderHeight
                            vc.refreshData()
                        }
                    }
                    
                    completionHandler(true)
                }
                deleteAction.image = "ic_delete_white".image_
                deleteAction.backgroundColor = .systemRed
                let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
                return configuration
            }
            return nil
    }
}
