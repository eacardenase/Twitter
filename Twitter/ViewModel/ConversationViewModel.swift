//
//  ConversationViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 8/3/26.
//

import SwiftUI

@Observable
class ConversationViewModel {
    var conversations = [Conversation]()
    var error: Error?

    var isEmpty: Bool {
        conversations.isEmpty
    }

    func fetchConversations() async {
        do {
            conversations = try await MessagingService.fetchConversations()
        } catch {
            self.error = error
        }
    }
}
