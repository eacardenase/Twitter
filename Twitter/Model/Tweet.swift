//
//  Tweet.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import Foundation

struct Tweet: Identifiable, Codable {
    var id: String = UUID().uuidString
    let body: String
    let user: User
    let likes: Int
    let createdAt: Date
}
