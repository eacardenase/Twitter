//
//  User.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import UIKit

struct MockUser: Identifiable, Hashable {
    let id = UUID().uuidString
    let name: String
    let username: String
    let image: ImageResource
}

let MOCK_USERS: [MockUser] = [
    .init(name: "Eddie Brock", username: "venom", image: .venom10),
    .init(name: "Bruce Wayne", username: "batman", image: .batman),
    .init(name: "Peter Parker", username: "spiderman", image: .spiderman),
]
