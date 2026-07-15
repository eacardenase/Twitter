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

    static var currentUser: FirebaseAuth.User? {
        return Auth.auth().currentUser
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
