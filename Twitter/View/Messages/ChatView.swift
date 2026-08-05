//
//  ChatView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ChatView: View {
    @State private var textInput = ""
    @Environment(AuthViewModel.self) var authViewModel
    var viewModel: ChatViewModel

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(viewModel.messages) {
                        ChatBubbleView(viewModel: MessageViewModel(message: $0))
                    }
                }
            }

            Divider()

            MessageInputView(text: $textInput) {
                guard let currentUser = authViewModel.user else { return }

                let message = Message(
                    fromId: currentUser.id,
                    toId: viewModel.user.id,
                    text: textInput,
                    createdAt: .now
                )

                Task {
                    await viewModel.send(message)

                    textInput = ""
                }
            }
        }
        .navigationTitle(viewModel.user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .scrollIndicators(.never)
    }
}

#Preview {
    NavigationStack {
        ChatView(viewModel: ChatViewModel(user: MOCK_USERS[0]))
    }
}
