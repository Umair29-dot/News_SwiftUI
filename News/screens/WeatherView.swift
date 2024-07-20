//
//  WeatherView.swift
//  News
//
//  Created by h on 22.06.2024.
//

import SwiftUI

struct WeatherView: View {
    
    @State private var greeting: String = WeatherManager.getTimeOfDay(date: Date())
    @StateObject private var locManager = LocationManager()
    @StateObject private var weatherViewModel = WeatherViewModel(controller: NetworkController())
    @EnvironmentObject private var stateViewModel: StateViewModel //To hide buttom navigation
    @State var clickedIndex:Int = -1
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack {
                    Text(greeting)
                        .font(.title)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "location")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.blue)
                            .frame(width: 13, height: 13)
                        
                        Text(locManager.locationName ?? "")
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .lineLimit(1)
                    }//: HSTACK
                    .padding(.all, 8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    
                }//: HSTACK
                
                switch weatherViewModel.cWeather {
                    
                case .notStarted:
                    EmptyView()
                    
                case .loading:
                    ProgressView()
                        .frame(maxWidth: .infinity, minHeight: 120)
                    
                case .success(let data):
                    if let weather = data {
                        currentTemperature(currentTemp: weather.temp, temCond: weather.description, feelLike: weather.feelsLike)
                        
                        Spacer().frame(height: 20)
                        
                        Section("Today") {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0 ..< 10) { index in
                                        TemperatureListItemView(clickedIndex: $clickedIndex, itemIndex: index)
                                    }
                                }//: LAZYHSTACK
                            }//: SCROLLVIEW
                        }//: SECTION
                        
                        Spacer().frame(height: 30)
                        
                        currentTemperatureDetail(weather: weather)
                    } else {
                        let pr = print("current weather data is null")
                    }
                    
                case .error(let error):
                    let er = print(error)
                    
                }
                
            }//: VSTACK
            .padding()
            
        }//: SCROLLVIEW
        .onAppear {
            stateViewModel.isTabViewVisible = false
        }
        .onDisappear {
            stateViewModel.isTabViewVisible = true
        }
        .task {
            await weatherViewModel.getCurrentWeather(location: "istanbul")
        }
    }
    
    @ViewBuilder
    func currentTemperature(currentTemp: String, temCond: String, feelLike: String) -> some View {
        return ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(currentTemp+"°C")
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Image("sunny")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipped()
                }//: HSTACK
                
                Text("Feels like \(feelLike)° / \(temCond)")
                    .foregroundColor(.white)
                
            }//: VSTACK
            .padding()
        }
        .frame(height: 150)
        .cornerRadius(20)
        .shadow(radius: 5, x: 2, y: 2)
    }
    
    @ViewBuilder
    func currentTemperatureDetail(weather: CurrentWeather) -> some View {
        let common = WeatherManager(currentWeather: weather)
        
        ZStack {
            VStack {
                HStack {
                    CurrentWeatherDetailItemView(icon: "mintemp", condition: common.minTemp, name: "Min")
                    
                    CurrentWeatherDetailItemView(icon: "humidity", condition: common.humidity, name: "Humidity")
                    
                    CurrentWeatherDetailItemView(icon: "pressure", condition: weather.pressure, name: "Pressure")
                }//: HSTACK
                
                Spacer().frame(height: 20)
                
                HStack {
                    CurrentWeatherDetailItemView(icon: "maxtemp", condition: common.maxTemp, name: "Max")
                    
                    CurrentWeatherDetailItemView(icon: "sunrise", condition: common.sunriseTime, name: "Sunrise")
                    
                    CurrentWeatherDetailItemView(icon: "sunset", condition: common.sunsetTime, name: "Sunset")
                }//: HSTACK
            }//: VSTACK
            .padding()
            
        }//: ZSTACK
        .frame(maxWidth: .infinity, minHeight: 250)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 2, x: 1, y: 1)
    }
    
}

#Preview {
    WeatherView()
        .environmentObject(StateViewModel())
}
