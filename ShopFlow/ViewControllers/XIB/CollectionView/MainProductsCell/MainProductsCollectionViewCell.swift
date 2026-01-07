//
//  MainProductsCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/9/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class MainProductsCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    var id: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        imgProduct.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 15)
        if let obj = self.object?.object as? ShopFlowProducts{
            self.id  = obj.id
            imgProduct.LoadImageFromUrl(url: obj.image)
            lblName.text = obj.name
            lblPrice.text = "\(obj.price ?? 0) ريال"
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let parent = self.parentVC as? MainProductsViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ProductDetialsViewController") as! ProductDetialsViewController
            vc.product_id = self.id
            parent.navigationController?.pushViewController(vc, animated: true)
        }else if let parent = self.parentVC as? ProductDetialsViewController {
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "ProductDetialsViewController") as! ProductDetialsViewController
        vc.product_id = self.id
        parent.navigationController?.pushViewController(vc, animated: true)
    }
    }
}
