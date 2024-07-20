//
//  AboutUsView.swift
//  News
//
//  Created by h on 22.06.2024.
//

import SwiftUI

struct AboutUsView: View {
    
    @EnvironmentObject private var stateViewModel: StateViewModel
    
    var body: some View {
        VStack {
            
            Spacer().frame(height: 20)
            
            IntroLottieView()
                .frame(width: 150, height: 150)
            
            Spacer().frame(height: 10)
            
            HStack {
                Text("About Us")
                    .fontWeight(.black)
                    .padding()
                    .background(Color.blue)
                
                Spacer()
            }//: HSTACK
            
            Spacer().frame(height: 10)
            
            
                Text("The app is created by Umair Nazim, a passionate software engineer. This app provides the users  a comprehensive and up-to-date news from around the world. The app is carefully developed by using swift, an expressive and powerful programming language for iOS development.")
                    .multilineTextAlignment(.leading)
                    .padding()
            
            HStack {
                Spacer()
                
                VStack {
                    Image("mypic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    .clipped()
                    
                    Text("Umair Nazim")
                }//: VSTACK
            }//: HSTACK
            .padding()
            
            Spacer()
        }//: VSTACK
        .onAppear {
            do {
                stateViewModel.isTabViewVisible = false
            } catch {
                print(error)
            }
        }
        .onDisappear {
            do {
                stateViewModel.isTabViewVisible = true
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    AboutUsView()
        .environmentObject(StateViewModel())
}
