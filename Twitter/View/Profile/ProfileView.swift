//
//  ProfileView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedOption: TweetFilterOption = .all

    let user: User

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)

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
