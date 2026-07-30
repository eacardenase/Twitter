//
//  TweetViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import SwiftUI

@Observable
class TweetViewModel: Codable {
    private(set) var tweet: Tweet
    var error: Error?
    var didLike = false

    // MARK: - Initializer

    init(tweet: Tweet) {
        self.tweet = tweet

        Task {
            await checkIfTweetIsLiked()
        }
    }

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case tweet
        case didLike
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        tweet = try container.decode(Tweet.self, forKey: .tweet)
        didLike = try container.decode(Bool.self, forKey: .didLike)

        // Transient state
        error = nil
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(tweet, forKey: .tweet)
        try container.encode(didLike, forKey: .didLike)
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

    func likeTweet() async {
        do throws(NetworkingError) {
            didLike.toggle()
            tweet.likes += 1

            try await TweetsService.like(tweet)
        } catch {
            didLike.toggle()
            tweet.likes -= 1
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print("DEBUG: Failed to like tweet with error: \(message)")
            }
        }
    }

    func unlikeTweet() async {
        do throws(NetworkingError) {
            didLike.toggle()
            tweet.likes -= 1

            try await TweetsService.unlike(tweet)
        } catch {
            didLike.toggle()
            tweet.likes += 1
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print("DEBUG: Failed to unlike tweet with error: \(message)")
            }
        }
    }

    func checkIfTweetIsLiked() async {
        do throws(NetworkingError) {
            didLike = try await TweetsService.checkIfTweetIsLiked(tweet)
        } catch {
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print(
                    "DEBUG: Faied to check if tweet is liked with error: \(message)"
                )
            }
        }
    }
}

// MARK: - Hashable

extension TweetViewModel: Hashable {
    static func == (lhs: TweetViewModel, rhs: TweetViewModel) -> Bool {
        lhs.tweet == rhs.tweet
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(tweet)
    }
}
