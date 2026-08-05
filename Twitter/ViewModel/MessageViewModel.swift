//
//  MessageViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 8/3/26.
//

import SwiftUI

@Observable
class MessageViewModel {
    let message: Message

    var isFromCurrentUser: Bool {
        guard let currentUserId = AuthService.currentUserId else {
            return false
        }

        return message.fromUserId == currentUserId
    }

    var text: String {
        message.text
    }

    var profileImageUrl: URL {
        message.fromUserProfileImageUrl
    }

    init(message: Message) {
        self.message = message
    }
}
