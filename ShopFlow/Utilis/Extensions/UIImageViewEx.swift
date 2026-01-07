//
//  UIImageViewEx.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func LoadImageFromUrl(url: String?, placeholder: String = DefualtImagePlaceHolder) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL.init(string: url ?? ""), placeholder: placeholder.image_)
    }
}
