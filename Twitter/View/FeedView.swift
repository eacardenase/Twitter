//
//  FeedView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct FeedView: View {
    @State private var isPresentingNewTweetView = false
    @State private var isPresentingLogOutAlert = false
    @State private var viewModel = FeedViewModel()
    @Environment(AuthViewModel.self) var authViewModel

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                if !viewModel.tweets.isEmpty {
                    ScrollView {
                        VStack {
                            ForEach(viewModel.tweets) {
                                TweetCellView(tweet: $0)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .scrollIndicators(.never)
                } else {
                    ContentUnavailableView(
                        "No tweets found",
                        systemImage: "magnifyingglass"
                    )
                }
            }

            ActionButton(systemImageName: "plus") {
                isPresentingNewTweetView.toggle()
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresentingNewTweetView) {
            if let user = authViewModel.user {
                NewTweetView(viewModel: TweetViewModel(user: user))
            }
        }
        .alert("Log Out?", isPresented: $isPresentingLogOutAlert) {
            Button("Log Out", role: .destructive) {
                withAnimation(.easeInOut) {
                    authViewModel.logUserOut()
                }
            }

            Button("Cancel", role: .cancel) {}
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isPresentingLogOutAlert.toggle()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
