//
//  SearchNewsItemView.swift
//  News
//
//  Created by h on 14.04.2024.
//

import SwiftUI

struct SearchNewsItemView: View {
    var article: NewsApiArticle
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 100)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 100)
            }
            .clipped()
            
            VStack(alignment: .leading) {
                Text(article.title ?? "")
                    .lineLimit(1)
                    .font(.system(size: 18, weight: .bold))
                
                Text(article.description ?? "")
                    .lineLimit(2)
                
                Spacer()
            }//: VSTACK
        }//: HSTACK
        .frame(height: 100)
    }
}

#Preview {
    SearchNewsItemView(
        article:
            NewsApiArticle(
                author: "Umair Nazim",
                title:  "Biden to hhchvhbxhcvhfvrgfvhrb rycryfergfergh",
                description: "huhuggugihuguhdggfjdjsueyrbvbgfjsieksodjfuf7tjvnflamcbfhty",
                content: "This is AI generated summarization, which may have errors.",
                url:  "https://www.rappler.com/world/asia-pacific/biden-to-warn-on-beijings-south-china-sea-moves-in-philippines-japan-summit/",
                urlToImage:  "https://nauka.ua/storage/uploads/public/661/8f6/2f9/6618f62f955c9075223496.jpg", source: NewsApiSource(name: "Umair")
            )
    )
}
