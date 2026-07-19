//
//  User.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import UIKit

struct User: Identifiable, Hashable, Codable {
    let id: String
    let fullname: String
    let username: String
    let email: String
    var followersCount: Int
    var followingCount: Int
    let profileImageUrl: URL
}

struct MockUser: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let name: String
    let username: String
    let image: String
}

let MOCK_USERS: [User] = [
    .init(
        id: "1",
        fullname: "Edwin Cardenas",
        username: "eacardenase",
        email: "eacardenase@gmail.com",
        followersCount: 0,
        followingCount: 0,
        profileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2Fqoi1hKbJepRvRLpeN14v4Geb4hY2%2F5D3B8AF7-D965-46A1-9186-88B9E6FAB2DE?alt=media&token=3e35ad5c-cc26-4470-97e8-f78c6b83841d"
        )!
    ),
    .init(
        id: "2",
        fullname: "Keyla Cardenas",
        username: "kjcardenase",
        email: "kjcardenase@gmail.com",
        followersCount: 0,
        followingCount: 0,
        profileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2FpxekWczvFSTKxdSl02b8ncrPDWh2%2F1AB8B9E3-1E7F-4A57-9D04-36786FC8E67C?alt=media&token=1bf91f03-6d5e-45ca-83e7-a7a9fcff2e3d"
        )!
    ),
    .init(
        id: "3",
        fullname: "Luisa Munoz",
        username: "lfmunozt",
        email: "lfmunozt@gmail.com",
        followersCount: 0,
        followingCount: 0,
        profileImageUrl: URL(
            string:
                "https://firebasestorage.googleapis.com:443/v0/b/twitter-6ece9.firebasestorage.app/o/images%2FqKVyyd2mVxbEpz6Y3yKUIQ1tlyt1%2FCB1D2322-92B2-4BCE-A711-C281E7EEE594?alt=media&token=443ae2b3-fe22-499c-b96d-c6a3d9fbc6af"
        )!
    ),
]
