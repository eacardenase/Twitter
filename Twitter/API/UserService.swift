//
//  UserService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/15/26.
//

import FirebaseFirestore

struct UserService {
    private init() {}

    static func store(_ user: User) throws -> User {
        try Firestore
            .firestore()
            .collection("users")
            .document(user.id)
            .setData(from: user)

        return user
    }

    static func fetchUser(
        withId userId: String
    ) async throws(NetworkingError) -> User {
        do {
            return
                try await Firestore
                .firestore()
                .collection("users")
                .document(userId)
                .getDocument(as: User.self)
        } catch {
            throw NetworkingError.serverError(error.localizedDescription)
        }
    }

    static func fetchUsers() async throws(NetworkingError) -> [User] {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError("")
        }

        do {
            let querySnapshot = try await Firestore.firestore().collection(
                "users"
            )
            .whereField("id", isNotEqualTo: currentUserId)
            .getDocuments()

            return querySnapshot.documents.compactMap {
                try? $0.data(as: User.self)
            }
        } catch {
            throw NetworkingError.serverError(error.localizedDescription)
        }
    }
}
