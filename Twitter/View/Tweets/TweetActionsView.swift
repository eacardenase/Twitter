//
//  TweetActionsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/24/26.
//

import SwiftUI

struct TweetActionsView: View {
    @Bindable var viewModel: TweetViewModel

    var body: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "bubble.left")
                    .frame(width: 32, height: 32)
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .frame(width: 32, height: 32)
            }

            Spacer()

            Button {
                Task {
                    if viewModel.didLike {
                        await viewModel.unlikeTweet()
                    } else {
                        await viewModel.likeTweet()
                    }
                }
            } label: {
                Image(systemName: viewModel.didLike ? "heart.fill" : "heart")
                    .frame(width: 32, height: 32)
                    .foregroundStyle(viewModel.didLike ? .red : .secondary)
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "bookmark")
                    .frame(width: 32, height: 32)
            }
        }
        .font(.title3)
        .foregroundStyle(.secondary)
    }
}

#Preview {
    TweetActionsView(viewModel: TweetViewModel(tweet: MOCK_TWEETS[0]))
}
