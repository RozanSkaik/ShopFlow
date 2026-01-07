//
//  RoundedImage.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/8/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit

class roundedImage: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

class roundedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}


class roundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}
