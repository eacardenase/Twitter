//
//  ChatBubbleView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import SwiftUI

struct ChatBubbleView: View {
    let viewModel: MessageViewModel
    let cornerRadius: CGFloat = 16

    var body: some View {
        HStack(alignment: .bottom) {
            if viewModel.isFromCurrentUser {
                Spacer()
            } else {
                UserProfileImageView(
                    url: viewModel.profileImageUrl,
                    width: 40,
                    height: 40
                )
            }

            Text(viewModel.text)
                .padding()
                .foregroundStyle(
                    viewModel.isFromCurrentUser ? .white : .primary
                )
                .background(
                    viewModel.isFromCurrentUser
                        ? Color.blue.gradient
                        : Color(.systemGray4).gradient
                )
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: cornerRadius,
                        bottomLeadingRadius: viewModel.isFromCurrentUser
                            ? cornerRadius : .zero,
                        bottomTrailingRadius: viewModel.isFromCurrentUser
                            ? .zero : cornerRadius,
                        topTrailingRadius: cornerRadius,
                    )
                )

            if !viewModel.isFromCurrentUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatBubbleView(viewModel: MessageViewModel(message: MOCK_MESSAGES[0]))
}
