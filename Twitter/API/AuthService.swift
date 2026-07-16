//
//  AuthService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/15/26.
//

import FirebaseAuth
import UIKit

enum NetworkingError: Error {
    case decodingError
    case serverError(String)
}

struct AuthCredentials {
    let fullname: String
    let username: String
    let email: String
    let password: String
    let profileImage: UIImage
}

struct AuthService {
    private init() {}

    static var currentUserId: String? {
        return Auth.auth().currentUser?.uid
    }

    static func verifyLogin() async throws -> User {
        guard let currentUserId = Auth.auth().currentUser?.uid else {
            throw NetworkingError.serverError(
                "Failed to get user, current user is nil."
            )
        }

        return try await UserService.fetchUser(withId: currentUserId)
    }

    static func logUserIn(
        withEmail email: String,
        password: String
    ) async throws -> User {
        let authResult = try await Auth.auth().signIn(
            withEmail: email,
            password: password
        )

        return try await UserService.fetchUser(withId: authResult.user.uid)
    }

    static func logUserOut() throws {
        try Auth.auth().signOut()
    }

    static func createrUser(
        with credentials: AuthCredentials
    ) async throws -> User {
        let authResult = try await Auth.auth().createUser(
            withEmail: credentials.email,
            password: credentials.password
        )
        let imageUrl = try await StorageService.upload(
            credentials.profileImage,
            forUserId: authResult.user.uid
        )
        let user = User(
            uid: authResult.user.uid,
            fullname: credentials.fullname,
            username: credentials.username,
            email: credentials.email,
            profileImageUrl: imageUrl
        )

        return try UserService.store(user)
    }
}
