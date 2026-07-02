//
//  FeedView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct FeedView: View {
    @State private var isPresentingNewTweetView = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        TweetCellView()
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)

            ActionButton(systemImageName: "plus") {
                isPresentingNewTweetView.toggle()
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresentingNewTweetView) {
            NewTweetView()
        }
    }
}

#Preview {
    FeedView()
}
