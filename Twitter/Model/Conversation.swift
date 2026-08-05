//
//  Conversation.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import Foundation

struct Conversation: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let fromUser: User
    let toUser: User
    let lastMessage: Message
}

let MOCK_CONVERSATIONS: [Conversation] = [
    .init(
        fromUser: MOCK_USERS[0],
        toUser: MOCK_USERS[1],
        lastMessage: MOCK_MESSAGES[0]
    )
]
