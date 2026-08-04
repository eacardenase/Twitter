//
//  Message.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import UIKit

struct Message: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let fromId: String
    let toId: String
    let text: String
    let createdAt: Date
}

let MOCK_MESSAGES: [Message] = [
    .init(fromId: "1", toId: "2", text: "Hello there!", createdAt: .now),
    .init(
        fromId: "2",
        toId: "1",
        text: "Hi man, how are you?",
        createdAt: .now
    ),
]
