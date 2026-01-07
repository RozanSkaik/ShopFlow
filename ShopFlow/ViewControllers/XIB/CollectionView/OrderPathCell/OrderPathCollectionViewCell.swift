//
//  OrderPathCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class OrderPathCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var pathView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func configureCell() {
        if let obj = self.object?.object as? Constants.OrderStatus{
            self.nameLbl.text = obj.status
            if let parent = self.parentVC as? OrderPathViewController{
                if obj.statusNo == parent.status{
                    self.image.image = obj.selectedImage
                }else{
                    self.image.image = obj.image
                }
                
            }
            
        }
        if self.indexPath.row == 2{
            pathView.isHidden = true
        }
    }
}
