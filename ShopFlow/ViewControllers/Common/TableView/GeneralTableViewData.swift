//
//  GeneralTableViewData.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit

class GeneralTableViewData {
    
    var identifier: String!
    
    var rowHeight: CGFloat?
    
    var object: Any?
    
    init(identifier: String, object: Any?, rowHeight: CGFloat? = nil) {
        self.identifier = identifier
        self.rowHeight = rowHeight
        self.object = object
    }
}
