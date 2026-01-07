//
//  CornersView.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/3/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit

 class CornersView: UIView {
    @IBInspectable
    open var cornerEdges: CGSize = CGSize(width: 20, height: 20)
    @IBInspectable  var topLeft: Bool = true
    @IBInspectable  var topRight: Bool = true
    @IBInspectable  var bottomLeft: Bool = true
    @IBInspectable  var bottomRight: Bool = true
    

    override func awakeFromNib() {
        var options = UIRectCorner()
        if topLeft {
           options =  options.union(.topLeft)
        }
        if topRight {
           options =  options.union(.topRight)
        }
        if bottomLeft {
          options =  options.union(.bottomLeft)
        }
        if bottomRight {
          options =  options.union(.bottomRight)
        }


        let path = UIBezierPath(roundedRect:self.bounds,
                                byRoundingCorners:options,
                                cornerRadii: self.cornerEdges)

        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
}
