//
//  SearchNews.swift
//  News
//
//  Created by h on 10.04.2024.
//

import SwiftUI

struct SearchNewsView: View {
    @State private var searchTerm: String = ""
    @State private var timer: Timer?
    private let viewModel = SearchNewsViewModel(networkController: NetworkController())
    
    var body: some View {
        NavigationView {
            VStack {
                Text(searchTerm)
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Search News")
                        .font(.title)
                        .fontWeight(.heavy)
                }
            }
        }//: NAVIGATIONVIEW
        .searchable(text: $searchTerm)
        .onChange(of: searchTerm) { value in
            
            timer?.invalidate()
                    
                    // Schedule a new timer to print the latest value after 3 seconds
                    timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                        print(searchTerm) // Print the latest value
                    }
            
            /*Task {
                await viewModel.searchNews(searchTerm: searchTerm)
            }*/
        }
    }
}

#Preview {
    SearchNewsView()
}
