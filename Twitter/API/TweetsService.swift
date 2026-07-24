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
}
