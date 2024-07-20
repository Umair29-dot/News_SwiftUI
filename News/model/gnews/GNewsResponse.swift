//
//  GNewsResponse.swift
//  News
//
//  Created by h on 11.04.2024.
//

import Foundation

struct GNewsResponse: Codable {
    let totalArticles: Int
    let articles: [GNewsArticle]
}
