//
//  DateHelpers.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/22/21.
//

import Foundation

func convertDateStringMDYToDate(dateMDY: String) -> Date {
    let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
    let newDate = dateFormatter.date(from: dateMDY)
    return newDate!

}
