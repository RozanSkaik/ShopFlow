//
//  GeneralCollectionViewCell.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//
import UIKit
import Foundation

protocol GeneralCollectionViewCellDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

class GeneralCollectionViewCell: UICollectionViewCell, GeneralCollectionViewCellDelegate {
    
    var cellDelegate: GeneralCollectionViewCellDelegate!
    
    var object: GeneralCollectionViewData?
    
    var collectionView: GeneralCollectionView?
    
    var parentVC: UIViewController?
    
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cellDelegate = self
    }

    func configureCell() {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}



