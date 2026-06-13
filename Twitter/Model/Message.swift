//
//  Message.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import UIKit

struct MockMessage: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    let image: String
    let text: String
    let isFromCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(image: "venom-10", text: "Hello there!", isFromCurrentUser: false),
    .init(
        image: "spiderman",
        text: "Hi man, how are you?",
        isFromCurrentUser: true
    ),
    .init(
        image: "venom-10",
        text: "I'm doing fine. How's aunt May?",
        isFromCurrentUser: false
    ),
    .init(image: "spiderman", text: "That's good.", isFromCurrentUser: true),
    .init(
        image: "spiderman",
        text: "Aunt May is doing fine. She's preparing lunch right now.",
        isFromCurrentUser: true
    ),
    .init(
        image: "spiderman",
        text: "You wanna come visit us?",
        isFromCurrentUser: true
    ),
    .init(
        image: "venom-10",
        text: "That would be awesome!",
        isFromCurrentUser: false
    ),
    .init(
        image: "venom-10",
        text: "I'll finish the laundry and will be there in a moment.",
        isFromCurrentUser: false
    ),
    .init(
        image: "spiderman",
        text: "Sure, don't forget buying the coke on your way here!",
        isFromCurrentUser: true
    ),
    .init(image: "venom-10", text: "Sure thing!", isFromCurrentUser: true),
]
