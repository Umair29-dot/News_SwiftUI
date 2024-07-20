//
//  NewsApiArticle.swift
//  News
//
//  Created by h on 12.04.2024.
//

import Foundation

struct NewsApiArticle: Decodable, Identifiable {
    let id = UUID()
    let author: String?
    let title: String?
    let description: String?
    let content: String?
    var url: String? = nil
    let urlToImage: String?
    var publishedAt: String? = nil
    var source: NewsApiSource
}
