//
//  BreakingNewsVerticalListItem.swift
//  News
//
//  Created by h on 12.04.2024.
//

import SwiftUI

struct VListItemView: View {
    var article: NewsApiArticle
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 100)
                    .frame(height: 150)
                
            } placeholder: {
                ProgressView()
                    .frame(minWidth: 100, alignment: .center)
                    .frame(height: 150, alignment: .center)
            }
            .clipped()
            
            Text(article.title ?? "--")
                .font(.system(size: 17, weight: .bold))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(Utils.formateDate(value: article.publishedAt ?? ""))
                        Text(article.source.name ?? "--")
                    }//: VSTACK
                    
                    Spacer().frame(width: 2)
                }//: HSTACK
            }//: VSTACK

        }//: VSTACK
        .frame(height: 250)
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(radius: 5, x: 2, y: 2)
        .padding(.top, 10)
    }
}

#Preview {
    VListItemView(
        article:
            NewsApiArticle(
                author: "Umair Nazim",
                title:  "Biden to hhchvhbxhcvhfvrgfvhrb rycryfergfergh.Biden to hhchvhbxhcvhfvrgfvhrb rycryfergfergh",
                description: "huhuggugihugu",
                content: "This is AI generated summarization, which may have errors.",
                url:  "https://www.rappler.com/world/asia-pacific/biden-to-warn-on-beijings-south-china-sea-moves-in-philippines-japan-summit/",
                urlToImage:  "https://nauka.ua/storage/uploads/public/661/8f6/2f9/6618f62f955c9075223496.jpg",
                publishedAt: "2024-07-15T12:34:56Z",
                source: NewsApiSource(name: "Umair")
            )
    )
}
