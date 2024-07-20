//
//  SearchNewsViewModel.swift
//  News
//
//  Created by h on 5.05.2024.
//

import Foundation

class SearchNewsViewModel: ObservableObject {
    
    enum Status {
        case notStarted
        case loading
        case success(data: [NewsApiArticle]?)
        case error(error: Error)
    }
    
    private var networkController: NetworkController
    
    @Published var news: Status = .notStarted
    
    init(networkController: NetworkController) {
        self.networkController = networkController
    }
    
    func searchNews(searchTerm: String) async {
        news = .loading
        
        do {
            let data = try await networkController.searchNewsAPI(searchTerm: searchTerm)
            let newsApiResponse = try JSONDecoder().decode(NewsApiResponse.self, from: data)
            self.news = .success(data: newsApiResponse.articles)
        } catch {
            self.news = .error(error: error)
        }
    }
    
}
