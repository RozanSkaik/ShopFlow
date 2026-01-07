//
//  MenuCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/17/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblProductDesc: UILabel!
    @IBOutlet weak var lblProductPrice: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    var id: Int?
    var has_colors: Int?
    var has_sizes: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? ShopFlowProducts{
            self.id = obj.id
            has_colors = obj.hasColors
            has_sizes = obj.hasSizes
            imgProduct.LoadImageFromUrl(url: obj.image)
            lblProductName.text = obj.name
            lblProductDesc.text = obj.descriptionField
            if obj.offerPrice == nil{
                 lblProductPrice.text = "\(obj.price ?? 0)"
            }else{
                 lblProductPrice.text = "\(obj.offerPrice ?? 0)"
            }
           
            if has_colors == 1 && has_sizes == 1{
                addToCartBtn.setTitle("تفاصيل المنتج", for: .normal)
            }else{
                addToCartBtn.setTitle("أضف الى السلة", for: .normal)
            }
        }
    }
    @IBAction func btnAddToCart(_ sender: UIButton) {
        if has_colors == 1 || has_sizes == 1{
            if let parent = self.parentVC as? SandwishViewController{
                let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ProductDetialsViewController") as! ProductDetialsViewController
                vc.product_id = self.id
                parent.navigationController?.pushViewController(vc, animated: true)
                
            }
        }else{
            let request = AddToCartRequest()
            request.product_id = "\(self.id ?? 0)"
            request.quantity = "1"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                if let vc = self.parentVC as? SandwishViewController{
                    vc.showAlertSuccess(message: obj.message ?? "")
                }
            }
        }
    }
}
