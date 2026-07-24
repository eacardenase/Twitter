//
//  TweetDetailsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/23/26.
//

import SwiftUI

struct TweetDetailsView: View {
    @Bindable var viewModel: TweetViewModel

    init(tweet: Tweet) {
        self.viewModel = TweetViewModel(tweet: tweet)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                UserProfileImageView(
                    url: viewModel.profileImageUrl,
                    width: 64,
                    height: 64
                )

                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.fullname)
                        .font(.subheadline.bold())

                    Text("@\(viewModel.username)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            Text(viewModel.body)
                .font(.title2)

            Text(viewModel.formattedDate)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Divider()

            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    Text("0")
                        .fontWeight(.bold)

                    Text("Retweets")
                        .foregroundStyle(.secondary)
                }

                HStack(spacing: 4) {
                    Text(viewModel.likes)
                        .fontWeight(.bold)

                    Text("Likes")
                        .foregroundStyle(.secondary)
                }
            }

            Divider()

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

                } label: {
                    Image(systemName: "heart")
                        .frame(width: 32, height: 32)
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

            Divider()

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TweetDetailsView(tweet: MOCK_TWEETS[0])
}
