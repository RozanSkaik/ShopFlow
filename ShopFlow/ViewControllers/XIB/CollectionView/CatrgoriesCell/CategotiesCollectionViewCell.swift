//
//  CategotiesCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class CategotiesCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var imgCatrgory: UIImageView!
    @IBOutlet weak var lblCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func configureCell() {
        if let obj = self.object?.object as? HomePageCategories{
            imgCatrgory.LoadImageFromUrl(url: obj.image)
            lblCategory.text = obj.name
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let parent = self.parentVC as? MainViewController{
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OrderServicesViewController") as! OrderServicesViewController
            vc.pagetype = .order
            if let obj = self.object?.object as? HomePageCategories{
                vc.categoryId = obj.id
            }
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
