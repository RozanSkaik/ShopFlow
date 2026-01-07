//
//  allCategoriesCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class allCategoriesCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var serviceImg: UIImageView!
    
    @IBOutlet weak var serviceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? HomePageCategories {
            self.serviceImg.LoadImageFromUrl(url: obj.image) 
            self.serviceLbl.text = obj.name
        }
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let parent = self.parentVC as? DigitalServicesViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "DesignCodeViewController") as! DesignCodeViewController
            if let obj = self.object?.object as? HomePageCategories {
                vc.digital_id = obj.id
                vc.navTitle = obj.name
            }
            parent.navigationController?.pushViewController(vc, animated: true)
        }else if let parent = self.parentVC as? CategoriesViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "OrderServicesViewController") as! OrderServicesViewController
            vc.pagetype = .other
            if let obj = self.object?.object as? HomePageCategories {
                vc.otherId = obj.id
            }
            parent.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
