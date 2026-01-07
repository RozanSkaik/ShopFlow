//
//  GeneralCollectionViewData.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit
 
class GeneralCollectionViewData {
    
    var identifier: String!
    
    var cellSize: CGSize?
    
    var object: Any?
    
    init(identifier: String, object: Any?, cellSize: CGSize? = nil) {
        self.identifier = identifier
        self.cellSize = cellSize
        self.object = object
    }
}
