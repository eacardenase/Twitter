//
//  FollowingService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/18/26.
//

import FirebaseFirestore

struct FollowingService {
    private init() {}

    static func follow(_ user: User) async throws(NetworkingError) {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            var currentUser = try await UserService.fetchUser(
                withId: currentUserId
            )

            currentUser.followingCount += 1

            try Firestore.firestore()
                .collection("following").document(currentUserId)
                .collection("user-following").document(user.id)
                .setData(from: user)

            try Firestore.firestore()
                .collection("followers").document(user.id)
                .collection("user-followers").document(currentUserId)
                .setData(from: currentUser)
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func unfollowUser(withId id: String) async throws(NetworkingError) {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }
    }
}
