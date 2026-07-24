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
    @Environment(Router.self) private var router

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                if !viewModel.tweets.isEmpty {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.tweets) { tweet in
                                Button {
                                    router.push(.tweet(tweet))
                                } label: {
                                    TweetCellView(tweet: tweet)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .scrollIndicators(.never)
                    .refreshable {
                        Task {
                            await viewModel.fetchAllTweets()
                        }
                    }
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
                let tweet = Tweet(
                    body: "",
                    user: user,
                    likes: 0,
                    createdAt: .now
                )

                NewTweetView(viewModel: TweetViewModel(tweet: tweet))
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
                    if let user = authViewModel.user {
                        UserProfileImageView(
                            url: user.profileImageUrl,
                            width: 32,
                            height: 32
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
        .environment(Router())
        .environment(AuthViewModel())
}
