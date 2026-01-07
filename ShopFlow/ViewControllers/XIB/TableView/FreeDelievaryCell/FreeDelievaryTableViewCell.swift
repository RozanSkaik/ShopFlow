//
//  FreeDelievaryTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import CoreLocation

class FreeDelievaryTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var imgDelivery: roundedImage!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? StoresFreeDelivery{
            imgDelivery.LoadImageFromUrl(url: obj.imageProfile ?? "")
            
            lblName.text = obj.name
            lblDiscount.text = "%\(obj.discountPercent ?? 0) خصم"
            let lat = obj.latitude ?? 0.0
            let long = obj.longitude ?? 0.0
            let coordinate0 = CLLocation(latitude: UserDefaults.standard.double(forKey: "latitude"), longitude: UserDefaults.standard.double(forKey: "longitude"))
            let coordinate1 = CLLocation(latitude: lat, longitude: long)
            let distanceInMeters = coordinate0.distance(from: coordinate1)
            let distanceInKM = Measurement(value: distanceInMeters, unit: UnitLength.meters).converted(to: .kilometers)
            lblLocation.text = "\(Int(distanceInKM.value)) كم"
//            lblDetails.text = obj.details
        }
    }
    
}
