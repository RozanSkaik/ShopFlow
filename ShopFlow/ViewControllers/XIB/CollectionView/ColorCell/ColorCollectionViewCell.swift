//
//  ColorCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 9/15/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: GeneralCollectionViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    var id: Int?
    
    override var isSelected: Bool{
        didSet {
            if self.isSelected == true{
                selectSubject()
            }else{
                unSelectSubject()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func configureCell() {
        if let obj = self.object?.object as? Color{
            self.id = obj.id
            lblName.text = obj.name
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = self.parentVC as? ProductDetialsViewController{
            if collectionView == vc.colorCollectionView{
               vc.colorId = id
            }else{
                vc.sizeId = id
            }
            
        }
        
    }
    
    func selectSubject(){
        viewBg.layer.borderWidth = 0
        viewBg.backgroundColor = "#199B97".color_
    }
    func unSelectSubject(){
        viewBg.backgroundColor = "#E2E2E2".color_
        viewBg.layer.borderColor = "#9A9A9A".color_.cgColor
        viewBg.layer.borderWidth = 1
    }
    
}
