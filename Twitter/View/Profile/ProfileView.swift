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

    var body: some View {
        ScrollView {
            LazyVStack {
                ProfileHeaderView(viewModel: viewModel)

                FilterButtonView(selectedOption: $selectedOption)

                TweetFilterView(
                    viewModel: viewModel,
                    selectedOption: selectedOption
                )
            }
        }
        .navigationTitle(viewModel.username)
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.never)
        .onAppear {
            Task {
                await viewModel.loadUserData()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(viewModel: UserViewModel(user: MOCK_USERS[0]))
            .environment(Router())
    }
}
