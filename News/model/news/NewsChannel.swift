//
//  NewsChannels.swift
//  News
//
//  Created by h on 15.07.2024.
//

import Foundation

class NewsChannel {
    let id = UUID()
    let channelName: String
    let channelURL: String
    let channelLogo: String
    
    init(channelName: String, channelURL: String, channelLogo: String) {
        self.channelName = channelName
        self.channelURL = channelURL
        self.channelLogo = channelLogo
    }
}
