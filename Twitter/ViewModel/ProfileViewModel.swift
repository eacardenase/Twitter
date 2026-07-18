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
    private var isFollowed = false

    init(user: User) {
        self.user = user
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

    var isFollowedText: String {
        isFollowed ? "Following" : "Follow"
    }

    func follow() async {
        do throws(NetworkingError) {
            try await FollowingService.follow(user)

            isFollowed = true
        } catch {
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
        isFollowed = false
    }
}
