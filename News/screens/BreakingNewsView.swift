//
//  BreakingNews.swift
//  News
//
//  Created by h on 10.04.2024.
//

import SwiftUI

struct BreakingNewsView: View {
    
    @StateObject private var viewModel = BreakingNewsViewModel(networkController: NetworkController())
    private let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]
    @State private var isActionSheet: Bool = false
    @State private var isNewsCategory: Bool = false
    @State private var isWeather: Bool = false
    @State private var isAboutUs: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(Resources.channels, id: \.id) { channel in
                            NavigationLink(destination: NewsDetailView(url: URL(string: channel.channelURL)!), label: {
                                NCListItemView(channel: channel)
                            })
                        }
                    }
                }
                
                ScrollView {
                    VStack {
                        //Horizontal
                        switch viewModel.GNewsHorizontal {
                        case .notStarted:
                            EmptyView()
                            
                        case .loading:
                            ProgressView()
                            
                        case .success(let data):
                            if data.gArticles != nil {
                                TabView {
                                    ForEach(0 ..< data.gArticles!.count) { index in
                                        NavigationLink(destination: NewsDetailView(url: URL(string: data.gArticles![index].url)!)) {
                                            HTabItemView(article: data.gArticles![index])
                                        }
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle())
                                .cornerRadius(10)
                                .frame(height: 250)
                                .padding(.bottom, 10)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            }
                            
                        case .error(let error):
                            let nm = print(error)
                        }
                        
                        //Vertical
                        switch viewModel.NewsApiVertical {
                        case .notStarted:
                            EmptyView()
                            
                        case .loading:
                            ProgressView()
                            
                        case .success(let data):
                            LazyVGrid(columns: columns, spacing: 15) {
                                ForEach(data.newsArticles!, id: \.id) { article in
                                    NavigationLink(destination: NewsDetailView(url: URL(string: article.url ?? "https://www.google.com")!)) {
                                        VListItemView(article: article)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal, 0)
                            
                        case .error(let error):
                            let nm = print(error)
                        }
                        
                        if isNewsCategory {
                            NavigationLink(destination: NewsCategoryView(), isActive: $isNewsCategory) {
                                      EmptyView() // Placeholder for button
                            }
                        }
                        
                        if isWeather {
                            NavigationLink(destination: WeatherView(), isActive: $isWeather) {
                                      EmptyView() // Placeholder for button
                            }
                        }
                        
                        if isAboutUs {
                            NavigationLink(destination: AboutUsView(), isActive: $isAboutUs) {
                                      EmptyView() // Placeholder for button
                            }
                        }
                        
                    }//: VSTACK
                    .padding(.all, 10)
                    
                }//: ScrollView
                .actionSheet(isPresented: $isActionSheet) {
                    ActionSheet(title: Text(""),
                                buttons: [
                                    .default(Text("News Category")) {
                                        isNewsCategory = true
                                    },
                                    .default(Text("Weather")) {
                                        isWeather = true
                                    },
                                    .default(Text("World Map")) {
                                        
                                    },
                                    .default(Text("About Us")) {
                                        isAboutUs = true
                                    },
                                    .cancel()
                                ]
                    )
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Breaking News")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "ellipsis")
                        .onTapGesture {
                            isActionSheet = true
                        }
                }
            }
            
        } //: NAVIGATIONVIEW
        .task {
            print("startFetching")
            await viewModel.getHorizontalNews()
        }
    }
}

#Preview {
    BreakingNewsView()
}
