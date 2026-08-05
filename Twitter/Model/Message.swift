//
//  Message.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import UIKit

struct Message: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let fromUserId: String
    let fromUserProfileImageUrl: URL
    let toUserId: String
    let toUserProfileImageUrl: URL
    let text: String
    let createdAt: Date
}

let MOCK_MESSAGES: [Message] = [
    .init(
        fromUserId: "1",
        fromUserProfileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2Fqoi1hKbJepRvRLpeN14v4Geb4hY2%2F5D3B8AF7-D965-46A1-9186-88B9E6FAB2DE?alt=media&token=3e35ad5c-cc26-4470-97e8-f78c6b83841d"
        )!,
        toUserId: "2",
        toUserProfileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2FqKVyyd2mVxbEpz6Y3yKUIQ1tlyt1%2FCB1D2322-92B2-4BCE-A711-C281E7EEE594?alt=media&token=443ae2b3-fe22-499c-b96d-c6a3d9fbc6af"
        )!,
        text: "Hi dear :#",
        createdAt: .now
    ),
    .init(
        fromUserId: "2",
        fromUserProfileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2FqKVyyd2mVxbEpz6Y3yKUIQ1tlyt1%2FCB1D2322-92B2-4BCE-A711-C281E7EEE594?alt=media&token=443ae2b3-fe22-499c-b96d-c6a3d9fbc6af"
        )!,
        toUserId: "2",
        toUserProfileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2Fqoi1hKbJepRvRLpeN14v4Geb4hY2%2F5D3B8AF7-D965-46A1-9186-88B9E6FAB2DE?alt=media&token=3e35ad5c-cc26-4470-97e8-f78c6b83841d"
        )!,
        text: "Hi dear :#",
        createdAt: .now
    ),
]
