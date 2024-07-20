//
//  Common.swift
//  News
//
//  Created by h on 1.07.2024.
//

import Foundation

class WeatherManager {
    
    //static let shared: Common = Common()
    
    var weather: CurrentWeather
    
    init(currentWeather: CurrentWeather) {
        self.weather = currentWeather
    }
    
    var sunriseTime: String {
        get {
            return timestampToTime(timestamp: weather.sunrise)
        }
    }
    
    var sunsetTime: String {
        get {
            return timestampToTime(timestamp: weather.sunset)
        }
    }
    
    var maxTemp: String {
        get {
            if let value = extractValue(value: weather.tempMax) {
                return value+"°C"
            } else {
                return ""
            }
        }
    }
    
    var minTemp: String {
        get {
            if let value = extractValue(value: weather.tempMin) {
                return value+"°C"
            } else {
                return ""
            }
        }
    }
    
    var humidity: String {
        get {
            if let value = extractValue(value: weather.humidity) {
                return value
            } else {
                return ""
            }
        }
    }
    
    private func extractValue(value: String) -> String? {
        let component = value.components(separatedBy: ".")
        return component.first ?? nil
    }
    
    private func timestampToTime(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short  //.short -> gives us just hours and minutes like 3:30 PM
        dateFormatter.timeZone = .current  //.current -> the time zone of current device
        return dateFormatter.string(from: date)
    }
    
    static func getTimeOfDay(date: Date) -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)

        switch hour {
        case 0..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        case 17..<24:
            return "Good Evening"
        default:
            return ""
        }
    }
    
}
