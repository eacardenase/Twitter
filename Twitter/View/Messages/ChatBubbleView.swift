//
//  ChatBubbleView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import SwiftUI

struct ChatBubbleView: View {
    let message: MockMessage
    let cornerRadius: CGFloat = 16

    var body: some View {
        HStack(alignment: .bottom) {
            if message.isFromCurrentUser {
                Spacer()
            } else {
                Image(message.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(.circle)
            }

            Text(message.text)
                .padding()
                .foregroundStyle(message.isFromCurrentUser ? .white : .primary)
                .background(
                    message.isFromCurrentUser
                        ? Color.blue.gradient
                        : Color(.systemGray4).gradient
                )
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: cornerRadius,
                        bottomLeadingRadius: message.isFromCurrentUser
                            ? cornerRadius : .zero,
                        bottomTrailingRadius: message.isFromCurrentUser
                            ? .zero : cornerRadius,
                        topTrailingRadius: cornerRadius,
                    )
                )

            if !message.isFromCurrentUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatBubbleView(message: MOCK_MESSAGES[0])
}
