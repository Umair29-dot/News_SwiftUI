//
//  Utlis.swift
//  News
//
//  Created by h on 15.07.2024.
//

import Foundation

class Utils {

    static func formateDate(value: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"  //actual formate of date string
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        //Convert string to date
        if let date = dateFormatter.date(from: value) {
            
            let dateOnlyFormatter = DateFormatter()
            dateOnlyFormatter.dateFormat = "yyyy-MM-dd" // your desired formate
            dateOnlyFormatter.timeZone = TimeZone(secondsFromGMT: 0)

            // Convert the Date object to a string with only the date
            let dateOnlyString = dateOnlyFormatter.string(from: date)
            return dateOnlyString
        } else {
            return ""
        }
    }
}
