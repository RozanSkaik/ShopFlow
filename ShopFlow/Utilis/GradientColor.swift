//
//  GradientColor.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/10/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit


class GradientButton: UIButton {
    let gradientLayer = CAGradientLayer()

    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }

    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        self.gradientLayer.frame = bounds
    }
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
           if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
               gradientLayer.frame = bounds
               gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
               gradientLayer.borderColor = layer.borderColor
               gradientLayer.borderWidth = layer.borderWidth
               gradientLayer.cornerRadius = layer.cornerRadius
               layer.insertSublayer(gradientLayer, at: 0)
           } else {
               gradientLayer.removeFromSuperlayer()
           }
       }
}
 class GradientView: UIView {
    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
//    @IBInspectable
//    open var cornerEdges: CGSize = CGSize(width: 20, height: 20)
//    @IBInspectable  var topLeft: Bool = true
//    @IBInspectable  var topRight: Bool = true
//    @IBInspectable  var bottomLeft: Bool = true
//    @IBInspectable  var bottomRight: Bool = true
//
//    override func awakeFromNib() {
//
//        var options = UIRectCorner()
//        if topLeft {
//           options =  options.union(.topLeft)
//        }
//        if topRight {
//           options =  options.union(.topRight)
//        }
//        if bottomLeft {
//          options =  options.union(.bottomLeft)
//        }
//        if bottomRight {
//          options =  options.union(.bottomRight)
//        }
//
//
//        let path = UIBezierPath(roundedRect:self.bounds,
//                                byRoundingCorners:options,
//                                cornerRadii: self.cornerEdges)
//
//        let maskLayer = CAShapeLayer()
//
//        maskLayer.path = path.cgPath
//        self.layer.mask = maskLayer
//    }
}
