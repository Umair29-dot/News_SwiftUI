//
//  NewsCategoryView.swift
//  News
//
//  Created by h on 22.06.2024.
//

import SwiftUI

struct NewsCategoryView: View {
    
    @State private var clickedPosition: Int = 0
    private let columns = [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)]
    private let categories = ["Business", "Health", "Entertainment", "Science", "Sports", "Technology"]
    @EnvironmentObject private var stateViewModel: StateViewModel
    @StateObject private var viewModel = NewsCategoryViewModel(networkController: NetworkController())
    
    var body: some View {
        //NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    //Horizontal
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(0 ..< categories.count) { index in
                                categoryButtonView(name: categories[index], pos: index, clickedPos: clickedPosition) { category in
                                    Task {
                                        await viewModel.fetchCategory(category: category.trimmingCharacters(in: .whitespaces).lowercased())
                                    }
                                }
                            }//: FOREACH
                        }//: LAZYHSTACK
                    }//: SCROLLVIEW
                    
                    //Vertical
                    switch viewModel.categoryNews {
                    case .notStarted:
                        EmptyView()
                    case .loading:
                        ProgressView()
                    case .success(let data):
                        if var item = data {
                            LazyVGrid(columns: columns) {
                                ForEach(item, id: \.id) { article in
                                    NavigationLink(destination: NewsDetailView(url: URL(string: article.url ?? "https://www.google.com")!)) {
                                        CategoryItemView(article: article)
                                    }
                                }
                            }//: LAZYHGRID
                        } else {
                            EmptyView()
                        }
                    case .error(let error):
                        let pr = print(error)
                    }
                    
                }//: VSTACK
                .padding()
                
            }
        //}
    }
    
    @ViewBuilder
    func categoryButtonView(name: String, pos: Int, clickedPos: Int, onClicked: @escaping (String) -> Void) -> some View {
        return Button {
            clickedPosition = pos
            onClicked(name)
        } label: {
            Text(name)
                .padding(EdgeInsets(top: 15, leading: 25, bottom: 15, trailing: 25))
                .background(pos == clickedPos ? Color.gray : Color.black)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    NewsCategoryView()
        .environmentObject(StateViewModel())
}
