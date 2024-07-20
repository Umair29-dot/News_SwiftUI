//
//  NetworkController.swift
//  News
//
//  Created by h on 11.04.2024.
//

import Foundation

final class NetworkController {
    private var GNewsUrl = URL(string: "\(Constants.BASE_URL_GNEWS_IO)/api/v4/top-headlines")!
    private var NewsApiUrl = URL(string: "\(Constants.BASE_URL_NewsApi_ORG)/v2/top-headlines")!
    private var NewsApiSearchUrl = URL(string: "\(Constants.BASE_URL_NewsApi_ORG)/v2/everything")!
    private var OpenWeatherUrl = URL(string: "\(Constants.BASE_URL_OPEN_WEATHER)/data/2.5/weather")!

    
    enum NetworkError: Error {
        case badURL, badResponse
    }
    
    func fetchGNews() async throws -> Data {
        var urlComponents = URLComponents(url: GNewsUrl, resolvingAgainstBaseURL: true)
        let urlQueryItem = URLQueryItem(name: "lang", value: "en")
        let urlQueryItem2 = URLQueryItem(name: "apikey", value: Constants.API_KEY_GNEWS_IO)
        urlComponents?.queryItems = [urlQueryItem, urlQueryItem2]
        
        guard let fetchURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        return data
    }
    
    func fetchNewsAPI() async throws -> Data {
        var urlComponents = URLComponents(url: NewsApiUrl, resolvingAgainstBaseURL: true)
        let urlQueryItem = URLQueryItem(name: "country", value: "us")
        let urlQueryItem2 = URLQueryItem(name: "apiKey", value: Constants.API_KEY_NewsApi_ORG)
        urlComponents?.queryItems = [urlQueryItem, urlQueryItem2]
        
        guard let fetchURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        return data
    }
    
    func searchNewsAPI(searchTerm: String) async throws -> Data {
        var urlComponents = URLComponents(url: NewsApiSearchUrl, resolvingAgainstBaseURL: true)
        let urlQueryItem = URLQueryItem(name: "q", value: searchTerm)
        let urlQueryItem2 = URLQueryItem(name: "page", value: "1")
        let urlQueryItem3 = URLQueryItem(name: "apiKey", value: Constants.API_KEY_NewsApi_ORG)
        urlComponents?.queryItems = [urlQueryItem, urlQueryItem2, urlQueryItem3]
        
        guard let fetchURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        return data
    }
    
    func fetchCategoryNews(category: String) async throws -> Data {
        //var urlComponents = URLComponents(url: GNewsUrl, resolvingAgainstBaseURL: true)
        //let urlQueryItem = URLQueryItem(name: "category", value: category)
        //let urlQueryItem2 = URLQueryItem(name: "lang", value: "en")
        //let urlQueryItem3 = URLQueryItem(name: "apikey", value: Constants.API_KEY_GNEWS_IO)
        //urlComponents?.queryItems = [urlQueryItem, urlQueryItem2, urlQueryItem3]
        let url = "https://gnews.io/api/v4/top-headlines?category=\(category)&lang=en&apikey=8c14afd7b72515c3adf62b574e1e5d27"
        
        guard let fetchURL = URL(string: url) else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        return data
    }
    
    func fetchCurrentWeather(location: String) async throws -> Data {
        var urlComponents = URLComponents(url: OpenWeatherUrl, resolvingAgainstBaseURL: true)
        let urlQueryItem = URLQueryItem(name: "q", value: location)
        let urlQueryItem2 = URLQueryItem(name: "appid", value: Constants.APP_ID_OPEN_WEATHER)
        let urlQueryItem3 = URLQueryItem(name: "units", value: "metric")
        urlComponents?.queryItems = [urlQueryItem, urlQueryItem2, urlQueryItem3]
        
        guard let fetchURL = urlComponents?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        return data
    }
    
}
