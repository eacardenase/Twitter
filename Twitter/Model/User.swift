//
//  User.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import UIKit

struct MockUser: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    let name: String
    let username: String
    let image: String
}

let MOCK_USERS: [MockUser] = [
    .init(name: "Eddie Brock", username: "venom", image: "venom-10"),
    .init(name: "Bruce Wayne", username: "batman", image: "batman"),
    .init(name: "Peter Parker", username: "spiderman", image: "spiderman"),
]
