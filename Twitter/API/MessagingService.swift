//
//  MessagingService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 8/3/26.
//

import FirebaseFirestore

struct MessagingService {
    private init() {}

    static func fetchConversations()
        async throws(NetworkingError) -> [Conversation]
    {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("messages")
                .document(currentUserId)
                .collection("recent-messages")
                .getDocuments()

            return querySnapshot.documents.compactMap {
                try? $0.data(as: Conversation.self)
            }
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func sendMessage(
        with text: String,
        to user: User
    ) async throws(NetworkingError) -> Message {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        let currentUser = try await UserService.fetchUser(
            withId: currentUserId
        )

        let message = Message(
            fromUserId: currentUserId,
            fromUserProfileImageUrl: currentUser.profileImageUrl,
            toUserId: user.id,
            toUserProfileImageUrl: user.profileImageUrl,
            text: text,
            createdAt: .now
        )

        do {
            try Firestore.firestore()
                .collection("messages")
                .document(currentUserId)
                .collection(user.id)
                .addDocument(from: message)

            try Firestore.firestore()
                .collection("messages")
                .document(user.id)
                .collection(currentUserId)
                .addDocument(from: message)

            try Firestore.firestore()
                .collection("messages")
                .document(currentUserId)
                .collection("recent-messages")
                .document(message.id)
                .setData(from: message)

            try Firestore.firestore()
                .collection("messages")
                .document(user.id)
                .collection("recent-messages")
                .document(message.id)
                .setData(from: message)

            return message
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func fetchMessages(
        for user: User
    ) async throws(NetworkingError) -> [Message] {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("messages")
                .document(currentUserId)
                .collection(user.id)
                .order(by: "createdAt")
                .getDocuments()

            return querySnapshot.documents.compactMap {
                try? $0.data(as: Message.self)
            }
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }
}
