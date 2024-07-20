//
//  HomeView.swift
//  News
//
//  Created by h on 9.04.2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var stateViewModel = StateViewModel()
    
    var body: some View {
        TabView {
            BreakingNewsView()
                .tabItem {
                    if stateViewModel.isTabViewVisible {
                        Image(systemName: "globe")
                        Text("Breaking News")
                    }
                }
            
            SavedNewsView()
                .tabItem {
                    if stateViewModel.isTabViewVisible {
                        Image(systemName: "square.and.arrow.down")
                        Text("Saved News")
                    }
                }
            
            SearchNewsView()
                .tabItem {
                    if stateViewModel.isTabViewVisible {
                        Image(systemName: "magnifyingglass")
                        Text("Search News")
                    }
                }
        }//: TABVIEW
        .background(Color.white)
        .environmentObject(stateViewModel)
    }
}

#Preview {
    HomeView()
}
