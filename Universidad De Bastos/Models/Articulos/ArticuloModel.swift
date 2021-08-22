//
//  ArticuloModel.swift
//  Universidad De Bastos
//
//  Created by Joseph Wyman on 8/8/21.
//

import Foundation

struct ArticuloModel: Hashable,Codable  {
    var _id: String
    var url: String
    var imageUrl: String
    var title : String
    var date : String
    var categories : [String]
    var author: String
    
    var dateMDY: String {
        let yearMonthDay = self.date.split(separator: "T")[0]
        let yearMonthDayArray = yearMonthDay.split(separator: "-")
        return "\(yearMonthDayArray[1])-\(yearMonthDayArray[2])-\(yearMonthDayArray[0])"
    }
}

extension ArticuloModel: Identifiable {
    var id: UUID {
        return UUID()
    }
    
    func getDateValueFromdateMDY() -> Date {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM-dd-yyyy"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
        var newDate = dateFormatter.date(from: self.dateMDY)
        return newDate!

    }
}
