//
//  ProfileActionView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileActionView: View {
    @Environment(Router.self) private var router
    @Environment(AuthViewModel.self) private var authViewModel
    @Bindable var viewModel: ProfileViewModel

    var isCurrentUser: Bool {
        viewModel.userId == authViewModel.user?.id
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
                    ProfileActionButton(title: viewModel.isFollowedText) {
                        Task {
                            await viewModel.follow()
                        }
                    }
                    .tint(.blue)

                    ProfileActionButton(title: "Message") {
                        let conversation = Conversation(
                            user: viewModel.user,
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
    ProfileActionView(viewModel: ProfileViewModel(user: MOCK_USERS[1]))
        .environment(Router())
        .environment(AuthViewModel())
}
