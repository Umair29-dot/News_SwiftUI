//
//  NewsDetailView.swift
//  News
//
//  Created by h on 13.04.2024.
//

import SwiftUI
import WebKit

struct NewsDetailView: UIViewRepresentable {
    var url: URL = URL(string: "https://www.google.com")!
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

#Preview {
    NewsDetailView(url: URL(string: "https://www.google.com")!)
}
