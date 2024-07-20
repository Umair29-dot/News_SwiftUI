//
//  CurrentWeather.swift
//  News
//
//  Created by h on 23.06.2024.
//

import Foundation

struct CurrentWeather {
    let id: UUID = UUID()
    let main: String
    let description: String
    let temp: String
    let feelsLike: String
    let tempMin: String
    let tempMax: String
    let pressure: String
    let humidity: String
    let sunrise: Int
    let sunset: Int
}
