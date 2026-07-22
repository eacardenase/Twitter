//
//  TweetViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import SwiftUI

@Observable
class TweetViewModel {
    let user: User
    var body: String = ""
    var error: Error?

    init(user: User) {
        self.user = user
    }

    var userId: String {
        user.id
    }

    var username: String {
        user.username
    }

    var fullname: String {
        user.fullname
    }

    var profileImageUrl: URL {
        user.profileImageUrl
    }

    var isValid: Bool {
        !body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    func store() {
        do throws(NetworkingError) {
            let tweet = Tweet(
                body: body,
                user: user,
                likes: 0,
                createdAt: .now
            )

            try TweetsService.upload(tweet)
        } catch {
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print("DEBUG: Failed to upload tweet with error: \(message)")
            }
        }
    }
}
