//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/18/26.
//

import SwiftUI

@Observable
class ProfileViewModel {
    var user: User
    var error: Error?
    var isFollowed = false

    init(user: User) {
        self.user = user

        Task {
            await checkIfUserIsFollowed()
        }
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
            user.followersCount += 1
            isFollowed = true

            try await FollowingService.follow(user)
        } catch {
            self.error = error
            isFollowed = false

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
            user.followersCount -= 1
            isFollowed = false

            try await FollowingService.unfollow(user)
        } catch {
            self.error = error
            isFollowed = true

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
