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

        return message.fromId == currentUserId
    }

    var text: String {
        message.text
    }

    var profileImageUrl: URL {
        URL(string: "")!
    }

    init(message: Message) {
        self.message = message
    }
}
