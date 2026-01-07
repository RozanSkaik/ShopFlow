//
//  OrderProductTableViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 10/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class OrderProductTableViewCell: GeneralTableViewCell {

    @IBOutlet weak var lblMealNo: UILabel!
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? OrderProducts{
//            lblMealNo.text = obj.meal
            lblMealName.text = obj.product?.name
            lblPrice.text = "\(obj.price ?? 0) ريال"
        }
    }
    
}
