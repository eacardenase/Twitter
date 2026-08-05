//
//  ChatView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ChatView: View {
    @Bindable var viewModel: ChatViewModel

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

            MessageInputView(text: $viewModel.newMessageText) {
                Task {
                    await viewModel.sendNewMessage()
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
