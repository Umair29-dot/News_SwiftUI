//
//  CurrentWeatherDetailItemView.swift
//  News
//
//  Created by h on 24.06.2024.
//

import SwiftUI

struct CurrentWeatherDetailItemView: View {
    
    let icon: String
    let condition: String
    let name: String
    
    var body: some View {
        VStack{
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
            
            Spacer().frame(height: 5)
            
            Text(condition)
            
            Text(name)
        }//: VSTACK
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CurrentWeatherDetailItemView(icon: "sunny", condition: "22.3", name: "Wind")
}
