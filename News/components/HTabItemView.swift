//
//  BreakingNewsHorizontalView.swift
//  News
//
//  Created by h on 11.04.2024.
//

import SwiftUI

struct HTabItemView: View {
    let article: GNewsArticle
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: article.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                ProgressView()
            }
            
            VStack {
                Spacer()
                
                VStack {
                    Text(article.title)
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .frame(width: 370)
                    
                }
                .frame(height: 70, alignment: .center)
                .frame(maxWidth: .infinity)
                .background(Color.black.opacity(0.5))
                
                Spacer()
                    .frame(height: 10)
            }//: VSTACK
        }//: ZSTACK
    }
}

#Preview {
    HTabItemView(
        article: 
            GNewsArticle(title:  "Biden to warn tecyefygfrgwecgygcfteftrehdcvgryechvbtrgfvbhgvchrvgyegcyrgvygrtbgtrvgtbrh",
                        description: "huhuggugihugu",
                        content: "This is AI generated summarization, which may have errors.",
                        url:"https://www.rappler.com/world/asia-pacific/biden-to-warn-on-beijings-south-china-sea-moves-in-philippines-japan-summit/",
                        image:  "https://www.rappler.com/tachyon/2024/04/ishida_USA-JAPAN.jpg")
    )
}
