//
//  ContentView.swift
//  News
//
//  Created by h on 9.04.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var showHomeView: Bool = false
    
    var body: some View {
        VStack {
            if showHomeView {
                HomeView()
            } else {
                IntroLottieView()
            }
        }//: VSTACK
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                self.showHomeView = true
            }
        }
    }
}

#Preview {
    SplashView()
}
