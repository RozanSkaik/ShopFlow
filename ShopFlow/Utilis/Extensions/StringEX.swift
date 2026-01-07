//
//  StringEX.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 7/7/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
import UIKit


extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var image_: UIImage? {
        return UIImage.init(named: self)
    }
    
    var localize_: String {
        return NSLocalizedString(self, comment: "")
    }
    
    var color_: UIColor {
        return UIColor.hexColor(hex: self)
    }
    
    
    func toDate(customFormat: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "en")
        dateFormatter.calendar = Calendar.init(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        dateFormatter.dateFormat = customFormat
        return dateFormatter.date(from: self) ?? Date()
    }
    
}
