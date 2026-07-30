//
//  TweetsService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import FirebaseFirestore

struct TweetsService {
    private init() {}

    static func upload(_ tweet: Tweet) throws(NetworkingError) {
        do {
            try Firestore.firestore()
                .collection("tweets").document(tweet.id)
                .setData(from: tweet)
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func fetchAllTweets() async throws(NetworkingError) -> [Tweet] {
        do {
            let querySnapshot = try await Firestore.firestore().collection(
                "tweets"
            )
            .order(by: "createdAt", descending: true)
            .getDocuments()

            return querySnapshot.documents.compactMap {
                try? $0.data(as: Tweet.self)
            }
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func fetchTweetsFor(_ user: User)
        async throws(NetworkingError) -> [Tweet]
    {
        return []
    }

    static func like(_ tweet: Tweet) async throws(NetworkingError) {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            let currentUser = try await UserService.fetchUser(
                withId: currentUserId
            )

            try Firestore.firestore()
                .collection("tweets").document(tweet.id)
                .collection("tweet-likes").document(currentUserId)
                .setData(from: currentUser)

            try Firestore.firestore()
                .collection("users").document(currentUserId)
                .collection("tweet-likes").document(tweet.id)
                .setData(from: tweet)
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }

    static func unlike(_ tweet: Tweet) async throws(NetworkingError) {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            try await Firestore.firestore()
                .collection("tweets").document(tweet.id)
                .collection("tweet-likes").document(currentUserId)
                .delete()

            try await Firestore.firestore()
                .collection("users").document(currentUserId)
                .collection("tweet-likes").document(tweet.id)
                .delete()
        } catch {
            throw NetworkingError.serverError(error.localizedDescription)
        }
    }

    static func checkIfTweetIsLiked(
        _ tweet: Tweet
    ) async throws(NetworkingError) -> Bool {
        guard let currentUserId = AuthService.currentUserId else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        do {
            let snapshot = try await Firestore.firestore()
                .collection("users").document(currentUserId)
                .collection("tweet-likes").document(tweet.id)
                .getDocument()

            return snapshot.exists
        } catch {
            throw .serverError(error.localizedDescription)
        }
    }
}
