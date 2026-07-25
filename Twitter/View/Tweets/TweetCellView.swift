//
//  TweetCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/9/26.
//

import SwiftUI

struct TweetCellView: View {
    @Bindable var viewModel: TweetViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
                UserProfileImageView(
                    url: viewModel.profileImageUrl,
                    width: 56,
                    height: 56
                )

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(viewModel.fullname)
                            .font(.subheadline.bold())
                            .lineLimit(1)

                        Spacer()
                        
                        Group {
                            Text("@\(viewModel.username)")

                            Text("•")

                            Text(
                                viewModel.createdAt.formatted(
                                    .dateTime.day().month()
                                )
                            )
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }

                    Text(viewModel.body)
                }
            }
            .padding(.bottom, 8)
            .contentShape(.rect)

            TweetActionsView(viewModel: viewModel)

            Divider()
        }
        .padding(.top)
    }
}

#Preview {
    TweetCellView(viewModel: TweetViewModel(tweet: MOCK_TWEETS[0]))
}
