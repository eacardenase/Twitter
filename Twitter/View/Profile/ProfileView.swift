//
//  ProfileView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileView: View {
    @Bindable var viewModel: ProfileViewModel
    @State private var selectedOption: TweetFilterOption = .all

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: viewModel)

                FilterButtonView(selectedOption: $selectedOption)

                //                ForEach(0..<10) { _ in
                //                    TweetCellView()
                //                }
                //                .padding(.horizontal)
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle(viewModel.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileView(viewModel: ProfileViewModel(user: MOCK_USERS[0]))
            .environment(Router())
    }
}
