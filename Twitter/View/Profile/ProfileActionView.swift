//
//  ProfileActionView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileActionView: View {
    let user: MockUser
    @Environment(Router.self) private var router

    var isCurrentUser: Bool {
        return false
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
    ProfileActionView(user: MOCK_USERS[0])
        .environment(Router())
}
