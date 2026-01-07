//
//  ProductCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var productId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? ShopFlowProducts{
            productId = obj.id
            imgProduct.LoadImageFromUrl(url: obj.image)
            lblName.text = obj.name
            lblPrice.text = "\(obj.price ?? 0) ريال"
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let parent = self.parentVC as? MainViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ProductDetialsViewController") as! ProductDetialsViewController
            vc.product_id = self.productId
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
