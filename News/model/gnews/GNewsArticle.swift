//
//  GNewsArticle.swift
//  News
//
//  Created by h on 11.04.2024.
//

import Foundation

struct GNewsArticle: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let content: String
    let url: String
    let image: String
    var publishedAt: String? = nil
    var source: GNewsSource? = nil
}
