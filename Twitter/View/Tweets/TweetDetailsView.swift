//
//  TweetDetailsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/23/26.
//

import SwiftUI

struct TweetDetailsView: View {
    let tweet: Tweet

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                UserProfileImageView(
                    url: tweet.user.profileImageUrl,
                    width: 64,
                    height: 64
                )

                VStack(alignment: .leading, spacing: 4) {
                    Text(tweet.user.fullname)
                        .font(.subheadline.bold())

                    Text("@\(tweet.user.username)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }

            Text(tweet.body)
                .font(.title2)

            HStack(spacing: 4) {
                Text(tweet.createdAt.formatted(.dateTime.hour().minute()))

                Text("•")

                Text(tweet.createdAt.formatted(.dateTime.day().month().year()))
            }
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
                    Text(tweet.likes.formatted())
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
