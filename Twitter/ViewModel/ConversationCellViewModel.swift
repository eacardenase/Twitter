//
//  ConversationCellViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 8/5/26.
//

import SwiftUI

@Observable
class ConversationCellViewModel {
    let conversation: Conversation

    var isFromCurrentUser: Bool {
        guard let currentUserId = AuthService.currentUserId else {
            return false
        }

        return conversation.fromUser.id == currentUserId
    }

    var profileImageUrl: URL {
        isFromCurrentUser
            ? conversation.toUser.profileImageUrl
            : conversation.fromUser.profileImageUrl
    }

    var chatPartner: User {
        isFromCurrentUser ? conversation.toUser : conversation.fromUser
    }

    var username: String {
        isFromCurrentUser
            ? conversation.toUser.username
            : conversation.fromUser.username
    }

    var text: String {
        conversation.lastMessage.text
    }

    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
