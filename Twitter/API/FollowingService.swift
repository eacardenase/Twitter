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

    static func unfollow(_ user: User) async throws(NetworkingError) {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            try await Firestore.firestore()
                .collection("following").document(currentUserId)
                .collection("user-following").document(user.id)
                .delete()

            try await Firestore.firestore()
                .collection("followers").document(user.id)
                .collection("user-followers").document(currentUserId)
                .delete()
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func checkIfUserIsFollowed(_ user: User)
        async throws(NetworkingError) -> Bool
    {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            let snapshot = try await Firestore.firestore()
                .collection("following").document(currentUserId)
                .collection("user-following").document(user.id)
                .getDocument()

            return snapshot.exists
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }
}
