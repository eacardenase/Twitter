//
//  ChatBubble.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import SwiftUI

struct ChatBubble: View {
    var isFromCurrentUser: Bool
    let cornerRadius: CGFloat = 16

    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
            }

            Text("Chat bubble")
                .padding()
                .foregroundStyle(isFromCurrentUser ? .white : .black)
                .background(
                    isFromCurrentUser
                        ? Color.blue.gradient
                        : Color(uiColor: .systemGray3).gradient
                )
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: cornerRadius,
                        bottomLeadingRadius: isFromCurrentUser
                            ? cornerRadius : .zero,
                        bottomTrailingRadius: isFromCurrentUser
                            ? .zero : cornerRadius,
                        topTrailingRadius: cornerRadius,
                    )
                )

            if !isFromCurrentUser {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatBubble(isFromCurrentUser: false)
}
