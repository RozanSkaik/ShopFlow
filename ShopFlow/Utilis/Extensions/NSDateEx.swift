//
//  NSDateEx.swift
//  ShopFlow
//
//  Created by Rozan Skaik on 8/28/20.
//  Copyright © 2020 Rozan Skaik. All rights reserved.
//

import Foundation
extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = NSLocale(localeIdentifier: "ar_DZ") as Locale
        return dateFormatter.string(from: self)
        // or use capitalized(with: locale) if you want
    }
    func getFormattedDate(format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateFormat = format
            return dateformat.string(from: self)
        }
        //Convert date to String
        func toString(customFormat: String, timeZone: String = "UTC") -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale.init(identifier: "en")
            dateFormatter.calendar = Calendar.init(identifier: .gregorian)
            dateFormatter.timeZone = TimeZone.init(identifier: timeZone)
            dateFormatter.dateFormat = customFormat
            return dateFormatter.string(from: self)
        }
}
