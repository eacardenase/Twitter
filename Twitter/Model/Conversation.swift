//
//  Conversation.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import Foundation

struct Conversation: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let user: MockUser
    let messages: [MockMessage]
}

let MOCK_CONVERSATIONS: [Conversation] = [
    .init(user: MOCK_USERS[0], messages: MOCK_MESSAGES),
    .init(user: MOCK_USERS[1], messages: MOCK_MESSAGES),
    .init(user: MOCK_USERS[2], messages: MOCK_MESSAGES),
]
