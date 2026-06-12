//
//  ChatBubble.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import SwiftUI

struct ChatBubble: View {
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
                .foregroundStyle(message.isFromCurrentUser ? .white : .black)
                .background(
                    message.isFromCurrentUser
                        ? Color.blue.gradient
                        : Color(.systemGray5).gradient
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
        }
    }
}

#Preview {
    ChatBubble(message: MOCK_MESSAGES[1])
}
