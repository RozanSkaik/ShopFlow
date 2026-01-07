//
//  ResturantTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/8/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit
import FloatRatingView
import CoreLocation

class ResturantTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var imgStore: roundedImage!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var viewRating: FloatRatingView!
    @IBOutlet weak var lblDistance: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    var storeObj: ViewStores?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func configureCell() {
        if let obj = self.object?.object as? ViewStores{
            storeObj = obj
            imgStore.LoadImageFromUrl(url: obj.imageProfile)
            lblStoreName.text = obj.name
            lblDiscount.text = "%\(obj.discountPercent ?? 0) خصم"
            lblStatus.text = obj.status
            viewRating.maxRating = obj.rate ?? 0
            lblDistance.text = Constants.shared.getDistance(fromLat: obj.latitude ?? 0.0, fromLong: obj.longitude ?? 0.0)
            lblDate.text = "\(obj.timeFrom ?? "") - \(obj.timeTo ?? "")"
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let parent = self.parentVC as? ResturantViewController {
            let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "MenuResturantViewController") as! MenuResturantViewController
            vc.storeObj = storeObj
            vc.currentStore = parent.currentStore
            let request = CategoryRequest()
            request.id = "\(vc.currentStore ?? 0)"
            RequestBuilder.requestWithSuccessfullRespnose(request: request) { (obj) in
                vc.categories = obj.categories
                parent.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}
