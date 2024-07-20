//
//  CategoryListItemView.swift
//  News
//
//  Created by h on 29.06.2024.
//

import SwiftUI

struct CategoryItemView: View {
    
    var article: GNewsArticle
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: article.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 170, height: 170)
                
            } placeholder: {
                ProgressView()
                    .frame(width: 170, height: 170, alignment: .center)
            }
            .clipped()
            
            VStack(alignment: .leading) {
                Text(article.title ?? "--")
                    .lineLimit(2)
                HStack {
                    Spacer()
                    
                    Text(article.publishedAt ?? "--")
                        .font(.footnote)
                }//: HSTACK
            }//: VSTACK
            .frame(width: 170, alignment: .leading)
        }//: VSTACK
        .background(Color.white)
        .cornerRadius(8.0)
        .shadow(radius: 5, x: 2, y: 2)
        .padding(.top, 10)
    }
}

#Preview {
    CategoryItemView(article: GNewsArticle(
        title:  "Biden to warn tecyefygfrgwecgygcfteftrehdcvgryechvbtrgfvbhgvchrvgyegcyrgvygrtbgtrvgtbrh",
        description: "huhuggugihugu",
        content: "This is AI generated summarization, which may have errors.",
        url:"https://www.rappler.com/world/asia-pacific/biden-to-warn-on-beijings-south-china-sea-moves-in-philippines-japan-summit/",
        image:  "https://www.rappler.com/tachyon/2024/04/ishida_USA-JAPAN.jpg",
        publishedAt: "29.09.2001")
    )
}
