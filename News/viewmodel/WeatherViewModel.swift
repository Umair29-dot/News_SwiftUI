//
//  WeatherViewModel.swift
//  News
//
//  Created by h on 23.06.2024.
//

import Foundation

@MainActor
class WeatherViewModel: ObservableObject {
    
    enum Status {
        case notStarted
        case loading
        case success(data: CurrentWeather?)
        case error(error: Error)
    }
    
    @Published private(set) var cWeather: Status = .notStarted
    
    private var controller: NetworkController
    
    init(controller: NetworkController) {
        self.controller = controller
    }
    
    func getCurrentWeather(location: String) async {
        var main: String = ""
        var description: String = ""
        
        self.cWeather = .loading
        
        do {
            let data = try await controller.fetchCurrentWeather(location: location)
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let weatherArray = try json["weather"] as! [Any]
                for weather in weatherArray {
                    var wethr = weather as! [String: Any]
                    main = wethr["main"] as! String
                    description = wethr["description"] as! String
                }
                let weatherObject = try json["main"] as! [String: Any]
                let sysObject = try json["sys"] as! [String: Any]
                
                self.cWeather = .success(data: CurrentWeather(
                    main: main,
                    description: description,
                    temp: String(weatherObject["temp"] as! Double).components(separatedBy: ".").first!,
                    feelsLike: String(weatherObject["feels_like"] as! Double).components(separatedBy: ".").first!,
                    tempMin: String(weatherObject["temp_min"] as! Double),
                    tempMax: String(weatherObject["temp_max"] as! Double),
                    pressure: String(weatherObject["pressure"] as! Int),
                    humidity: String(weatherObject["humidity"] as! Double),
                    sunrise: sysObject["sunrise"] as! Int,
                    sunset: sysObject["sunset"] as! Int
                    )
                )
            }
        } catch {
            self.cWeather = .error(error: error)
        }
    }
    
}
