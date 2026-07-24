//
//  TweetViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import SwiftUI

@Observable
class TweetViewModel {
    private var tweet: Tweet
    var error: Error?

    init(tweet: Tweet) {
        self.tweet = tweet
    }

    var userId: String {
        tweet.user.id
    }

    var username: String {
        tweet.user.username
    }

    var fullname: String {
        tweet.user.fullname
    }

    var profileImageUrl: URL {
        tweet.user.profileImageUrl
    }

    var body: String {
        get { tweet.body }
        set { tweet.body = newValue }
    }

    var likes: String {
        tweet.likes.formatted()
    }

    var createdAt: Date {
        tweet.createdAt
    }

    var isValid: Bool {
        !tweet.body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var formattedDate: String {
        let hour = tweet.createdAt.formatted(.dateTime.hour().minute())
        let day = tweet.createdAt.formatted(.dateTime.day().month().year())

        return "\(hour) • \(day)"
    }

    func store() {
        do throws(NetworkingError) {
            print(tweet)

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
