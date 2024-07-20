//
//  Resources.swift
//  News
//
//  Created by h on 15.07.2024.
//

import Foundation
class Resources {
    static var channels: [NewsChannel] {
        get {
            return [
                NewsChannel(channelName: "CNN", channelURL: "https://www.cnn.com", channelLogo: "cnn_logo"),
                NewsChannel(channelName: "BBC", channelURL: "https://www.bbc.com/news", channelLogo: "bbc_logo"),
                NewsChannel(channelName: "Al Jazeera", channelURL: "https://www.aljazeera.com", channelLogo: "jazeera_logo"),
                NewsChannel(channelName: "Fox News", channelURL: "https://www.foxnews.com", channelLogo: "fox_logo"),
                NewsChannel(channelName: "New York Times", channelURL: "https://www.nytimes.com", channelLogo: "newyork_times_logo"),
                NewsChannel(channelName: "The Guardians", channelURL: "https://www.theguardian.com", channelLogo: "guardian_logo"),
                NewsChannel(channelName: "Bloomberg", channelURL: "https://www.bloomberg.com", channelLogo: "bloomberg_logo"),
                NewsChannel(channelName: "NBC News", channelURL: "https://www.nbcnews.com", channelLogo: "nbc_logo")
            ]
        }
    }
}
