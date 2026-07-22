//
//  TweetsService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import FirebaseFirestore

struct TweetsService {
    private init() {}

    static func upload(_ tweet: Tweet) throws {
        try Firestore.firestore()
            .collection("tweets").document(tweet.id)
            .setData(from: tweet)
    }
}
