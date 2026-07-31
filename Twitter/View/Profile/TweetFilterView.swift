//
//  TweetFilterView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/30/26.
//

import SwiftUI

struct TweetFilterView: View {
    let viewModel: UserViewModel
    let selectedOption: TweetFilterOption
    @Environment(Router.self) var router

    var tweets: [Tweet] {
        switch selectedOption {
        case .all: viewModel.userTweets
        case .replies: []
        case .likes: viewModel.likedTweets
        }
    }

    var body: some View {
        Group {
            if tweets.isEmpty {
                ContentUnavailableView(
                    "Upps...",
                    systemImage: "info.circle",
                    description: Text("There are no tweets to show")
                )
            } else {
                ForEach(tweets) { tweet in
                    let tweetViewModel = TweetViewModel(tweet: tweet)

                    Button {
                        router.push(.tweet(tweetViewModel))
                    } label: {
                        TweetCellView(viewModel: tweetViewModel)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.horizontal)
            }
        }
    }
}
