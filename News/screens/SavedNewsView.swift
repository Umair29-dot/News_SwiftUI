//
//  SavedNews.swift
//  News
//
//  Created by h on 10.04.2024.
//

import SwiftUI

struct SavedNewsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello")
            }//: VSTACK
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Saved News")
                        .font(.title)
                        .fontWeight(.heavy)
                }
            }
        }//: NAVIGATIONVIEW
    }
}

#Preview {
    SavedNewsView()
}
