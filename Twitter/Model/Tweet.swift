//
//  Tweet.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import Foundation

struct Tweet: Identifiable, Hashable, Codable {
    var id: String = UUID().uuidString
    var body: String
    let user: User
    var likes: Int
    let createdAt: Date
}

let MOCK_TWEETS: [Tweet] = [
    .init(
        body: "It's not who I am underneath, but what I do that defines me.",
        user: MOCK_USERS[0],
        likes: 0,
        createdAt: .now
    )
]
