//
//  NCListIItemView.swift
//  News
//
//  Created by h on 15.07.2024.
//

import SwiftUI

struct NCListItemView: View {
    let channel: NewsChannel
    
    var body: some View {
        VStack {
            Image(channel.channelLogo)
                .resizable()
                .padding()
                .aspectRatio(contentMode: .fill)
                .background(Color.white)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)
        } //: VSTACK
        .padding(.all, 10)
    }
}

#Preview {
    NCListItemView(channel: NewsChannel(channelName: "CNN", channelURL: "www.cnn.com", channelLogo: "newyork_times_logo"))
}
