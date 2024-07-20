//
//  BreakingNewsViewModel.swift
//  News
//
//  Created by h on 11.04.2024.
//

import Foundation

@MainActor
class BreakingNewsViewModel: ObservableObject {
    
    enum Status {
        case notStarted
        case loading
        case success(data: (gArticles: [GNewsArticle]?, newsArticles: [NewsApiArticle]?))
        case error(error: Error)
    }
    
    private var networkController: NetworkController
    
    @Published private(set) var GNewsHorizontal: Status = .notStarted
    @Published private(set) var NewsApiVertical: Status = .notStarted
    
    init(networkController: NetworkController) {
        print("init")
        self.networkController = networkController        
    }
    
    deinit {
        print("dinit")
    }
    
    func getHorizontalNews() async {
        self.GNewsHorizontal = .loading
        do {
            let data = try await networkController.fetchGNews()
            let gNewsResponse = try JSONDecoder().decode(GNewsResponse.self, from: data)
            self.GNewsHorizontal = .success(data: (gNewsResponse.articles, nil))
            
            await getVerticalNews()
        } catch {
            self.GNewsHorizontal = .error(error: error)
        }
    }
    
    func getVerticalNews() async {
        self.NewsApiVertical = .loading
        do {
            let data = try await networkController.fetchNewsAPI()
            let newsApiResponse = try JSONDecoder().decode(NewsApiResponse.self, from: data)
            self.NewsApiVertical = .success(data: (nil, newsApiResponse.articles))
        } catch {
            self.NewsApiVertical = .error(error: error)
        }
    }
    
}
