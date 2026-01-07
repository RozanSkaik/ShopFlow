//
//  NearPlacesCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import CoreLocation

class NearPlacesCollectionViewCell: GeneralCollectionViewCell {

    @IBOutlet weak var imgStore: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func configureCell() {
        if let obj = self.object?.object as? ViewStores{
            imgStore.LoadImageFromUrl(url: obj.imageProfile)
            lblName.text = obj.name
            lblAddress.text = obj.address
            distance.text = Constants.shared.getDistance(fromLat: obj.latitude ?? 0.0, fromLong: obj.longitude ?? 0.0)
        }
    }

}
