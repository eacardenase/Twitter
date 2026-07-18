//
//  ProfileActionView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileActionView: View {
    let user: User
    @Environment(Router.self) private var router
    @Environment(AuthViewModel.self) private var viewModel

    var isCurrentUser: Bool {
        user.id == viewModel.user?.id
    }

    var body: some View {
        Group {
            if isCurrentUser {
                ProfileActionButton(title: "Edit Profile") {
                    // TODO:
                }
                .tint(.blue)
            } else {
                HStack(spacing: 16) {
                    ProfileActionButton(title: "Follow") {
                        // TODO:
                    }
                    .tint(.blue)

                    ProfileActionButton(title: "Message") {
                        let conversation = Conversation(
                            user: user,
                            messages: []
                        )

                        router.push(.conversation(conversation))
                    }
                    .tint(.purple)
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileActionView(user: MOCK_USERS[1])
        .environment(Router())
        .environment(AuthViewModel())
}
