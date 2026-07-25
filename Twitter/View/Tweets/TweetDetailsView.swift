//
//  TweetDetailsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/23/26.
//

import SwiftUI

struct TweetDetailsView: View {
    @Bindable var viewModel: TweetViewModel

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

            TweetStatisticsView(viewModel: viewModel)

            Divider()

            TweetActionsView(viewModel: viewModel)

            Divider()

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TweetDetailsView(viewModel: TweetViewModel(tweet: MOCK_TWEETS[0]))
}
