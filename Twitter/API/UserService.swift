//
//  UserService.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/15/26.
//

import FirebaseFirestore

struct UserService {
    private init() {}
    
    static func store(_ user: User) throws -> User {
        try Firestore
            .firestore()
            .collection("users")
            .document(user.uid)
            .setData(from: user)
        
        return user
    }
}
