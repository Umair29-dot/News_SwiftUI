//
//  NewsApiResponse.swift
//  News
//
//  Created by h on 12.04.2024.
//

import Foundation

struct NewsApiResponse: Decodable {
    let articles: [NewsApiArticle]
    let status: String
    let totalResults: Int
}
