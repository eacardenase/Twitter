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

            TweetActionsView()

            Divider()
        }
        .padding(.top)
    }
}

#Preview {
    TweetCellView(tweet: MOCK_TWEETS[0])
}
