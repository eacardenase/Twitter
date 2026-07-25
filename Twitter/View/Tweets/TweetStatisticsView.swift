//
//  TweetStatisticsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/24/26.
//

import SwiftUI

struct TweetStatisticsView: View {
    @Bindable var viewModel: TweetViewModel

    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 4) {
                Text("0")
                    .fontWeight(.semibold)
                
                Text("Retweets")
                    .foregroundStyle(.secondary)
            }
            
            HStack(spacing: 4) {
                Text(viewModel.likes)
                    .fontWeight(.semibold)
                
                Text("Likes")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    TweetStatisticsView(viewModel: TweetViewModel(tweet: MOCK_TWEETS[0]))
}
