//
//  ChatView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ChatView: View {
    let conversation: Conversation
    @State private var textInput = ""

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(conversation.messages) { message in
                        ChatBubbleView(message: message)
                    }
                }
            }

            Divider()

            MessageInputView(text: $textInput) {
                // TODO: Send message
            }
        }
        .navigationTitle(conversation.user.username)
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .scrollIndicators(.never)
    }
}

#Preview {
    NavigationStack {
        ChatView(conversation: MOCK_CONVERSATIONS[0])
    }
}
