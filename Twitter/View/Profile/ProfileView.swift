//
//  ProfileView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileView: View {
    @Bindable var viewModel: UserViewModel
    @State private var selectedOption: TweetFilterOption = .all
    @State private var tweets = [Tweet]()

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)

                FilterButtonView(selectedOption: $selectedOption)

                ForEach(viewModel.userTweets) {
                    TweetCellView(viewModel: TweetViewModel(tweet: $0))
                }
                .padding(.horizontal)
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle(viewModel.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileView(viewModel: UserViewModel(user: MOCK_USERS[0]))
            .environment(Router())
    }
}
