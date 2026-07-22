//
//  TweetCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/9/26.
//

import SwiftUI

struct TweetCellView: View {
    let tweet: Tweet

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
                UserProfileImageView(
                    url: tweet.user.profileImageUrl,
                    width: 56,
                    height: 56
                )

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(tweet.user.fullname)
                            .font(.subheadline.bold())

                        Group {
                            Text("@\(tweet.user.username)")

                            Text("•")

                            Text(
                                tweet.createdAt.formatted(
                                    .dateTime.day().month()
                                )
                            )
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }

                    Text(tweet.body)
                }
            }
            .padding(.bottom, 8)

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
        }
        .padding(.top)
    }
}
