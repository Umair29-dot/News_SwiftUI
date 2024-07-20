//
//  TemperatureListItemView.swift
//  News
//
//  Created by h on 23.06.2024.
//

import SwiftUI

struct TemperatureListItemView: View {
    
    @Binding var clickedIndex: Int
    var itemIndex: Int
    
    var body: some View {
        ZStack {
            VStack {
                Text("9:00 am")
                
                Spacer().frame(height: 20)
                
                Image("sunny")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .clipped()
                
                Spacer().frame(height: 20)
                
                Text("30°/32°")
                
                Text("Partely Cloudy")
                    .foregroundColor(.gray)
            }//:VSTACK
            .padding(clickedIndex == itemIndex ? 13 : 5)
            
        }//: ZSTACK
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5, x: 2, y: 2)
        .padding(EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5))
        .onTapGesture {
            clickedIndex = itemIndex
        }
    }
}

#Preview {
    TemperatureListItemView(clickedIndex: .constant(-1), itemIndex: 1)
}
