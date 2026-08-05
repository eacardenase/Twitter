//
//  MessageInputView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct MessageInputView: View {
    @Bindable var viewModel: ChatViewModel

    var body: some View {
        HStack {
            TextField("Message...", text: $viewModel.text)

            Button {
                Task {
                    await viewModel.sendNewMessage()
                }
            } label: {
                Text("Send")
                    .fontWeight(.bold)
            }
        }
        .padding()
        .frame(minHeight: 30)
    }
}

#Preview {
    MessageInputView(viewModel: ChatViewModel(user: MOCK_USERS[0]))
}
