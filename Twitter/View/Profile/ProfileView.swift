//
//  ProfileView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var viewModel: ProfileViewModel
    @State private var selectedOption: TweetFilterOption = .all

    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)

                FilterButtonView(selectedOption: $selectedOption)

                ForEach(0..<10) { _ in
                    TweetCellView()
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
        ProfileView(user: MOCK_USERS[0])
            .environment(Router())
    }
}
