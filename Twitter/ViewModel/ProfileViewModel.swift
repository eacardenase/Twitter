//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/18/26.
//

import SwiftUI

@Observable
class ProfileViewModel: Codable {
    private(set) var user: User
    var error: Error?
    var isFollowed = false

    init(user: User) {
        self.user = user

        Task {
            await checkIfUserIsFollowed()
        }
    }

    // MARK: - Codable

    enum CodingKeys: String, CodingKey {
        case user
        case isFollowed
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        user = try container.decode(User.self, forKey: .user)
        isFollowed = try container.decode(Bool.self, forKey: .isFollowed)
        error = nil
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(user, forKey: .user)
        try container.encode(isFollowed, forKey: .isFollowed)
    }

    var userId: String {
        user.id
    }

    var fullname: String {
        user.fullname
    }

    var username: String {
        user.username
    }

    var profileImageUrl: URL {
        user.profileImageUrl
    }

    var followersCount: String {
        user.followersCount.formatted()
    }

    var followingCount: String {
        user.followingCount.formatted()
    }

    var isFollowedText: String {
        isFollowed ? "Following" : "Follow"
    }

    func follow() async {
        do throws(NetworkingError) {
            isFollowed.toggle()
            user.followersCount += 1

            try await FollowingService.follow(user)
        } catch {
            isFollowed.toggle()
            user.followersCount -= 1
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print("DEBUG: Faied to follow user with error: \(message)")
            }
        }
    }

    func unfollow() async {
        do throws(NetworkingError) {
            isFollowed.toggle()
            user.followersCount -= 1

            try await FollowingService.unfollow(user)
        } catch {
            isFollowed.toggle()
            user.followersCount += 1
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print("DEBUG: Faied to unfollow user with error: \(message)")
            }
        }
    }

    func checkIfUserIsFollowed() async {
        do throws(NetworkingError) {
            isFollowed = try await FollowingService.checkIfUserIsFollowed(user)
        } catch {
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print(
                    "DEBUG: Faied to check if user is followed with error: \(message)"
                )
            }
        }
    }
}

// MARK: - Hashable

extension ProfileViewModel: Hashable {
    static func == (lhs: ProfileViewModel, rhs: ProfileViewModel) -> Bool {
        lhs.user == rhs.user
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(user)
    }
}
