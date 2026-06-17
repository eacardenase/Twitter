//
//  ProfileView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileView: View {
    let user: MockUser

    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(user: user)

                Spacer()
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
    }
}
