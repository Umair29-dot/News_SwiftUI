//
//  NewsCategoryViewModel.swift
//  News
//
//  Created by h on 26.06.2024.
//

import Foundation

@MainActor
class NewsCategoryViewModel: ObservableObject {
    
    enum Status {
        case notStarted
        case loading
        case success(data: [GNewsArticle]?)
        case error(error: Error)
    }
    
    private var networkController: NetworkController
    
    @Published private(set) var categoryNews = Status.notStarted
    
    init(networkController: NetworkController) {
        self.networkController = networkController
        Task {
            await fetchCategory(category: "Business")
        }
    }
    
    deinit {
        print("dinit")
    }
    
    func fetchCategory(category: String) async {
        self.categoryNews = .loading
        do {
            print(category)
            let data = try await networkController.fetchCategoryNews(category: category)
            let gnewsResponse = try JSONDecoder().decode(GNewsResponse.self, from: data)
            print(gnewsResponse.articles)
            self.categoryNews = .success(data: gnewsResponse.articles)
        } catch {
            self.categoryNews = .error(error: error)
        }
    }
    
}
