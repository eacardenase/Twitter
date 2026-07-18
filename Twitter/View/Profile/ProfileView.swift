//
//  ProfileView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @State private var selectedOption: TweetFilterOption = .all

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(viewModel: ProfileViewModel(user: user))

                FilterButtonView(selectedOption: $selectedOption)

                ForEach(0..<10) { _ in
                    TweetCellView()
                }
                .padding(.horizontal)
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ProfileView(user: MOCK_USERS[0])
            .environment(Router())
    }
}
