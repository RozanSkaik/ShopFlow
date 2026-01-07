//
//  OffersTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class OffersTableViewCell: GeneralTableViewCell {
    
    @IBOutlet weak var imgOffer: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var stackViewFreeDelivery: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? Offer{
            self.imgOffer.LoadImageFromUrl(url: obj.image, placeholder: "offer")
            self.lblTitle.text = obj.name
            self.lblDescription.text = obj.descriptionField
            self.lblOfferPrice.text = "  \(obj.offerPrice ?? 0) $  "
            if obj.deliveryCost != 0{
                stackViewFreeDelivery.isHidden = true
            }else{
                stackViewFreeDelivery.isHidden = false
            }
        }
    }
}
