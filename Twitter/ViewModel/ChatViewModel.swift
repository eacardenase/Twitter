//
//  ChatViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 8/3/26.
//

import SwiftUI

@Observable
class ChatViewModel: Codable {
    let user: User
    var error: Error?
    var newMessageText: String = ""
    var messages = [Message]()

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case user
        case messages
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        user = try container.decode(User.self, forKey: .user)
        messages = try container.decode([Message].self, forKey: .messages)
        error = nil
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(user, forKey: .user)
        try container.encode(messages, forKey: .messages)
    }

    var isEmpty: Bool {
        messages.isEmpty
    }

    init(user: User) {
        self.user = user
    }

    func fetchMessages() {}

    func sendNewMessage() async {
        do {
            let newMessage = try await MessagingService.sendMessage(
                with: newMessageText,
                to: user
            )

            messages.append(newMessage)

            newMessageText = ""
        } catch {
            self.error = error
        }
    }
}

// MARK: - Hashable

extension ChatViewModel: Hashable {
    static func == (lhs: ChatViewModel, rhs: ChatViewModel) -> Bool {
        lhs.user == rhs.user
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
    }
}
