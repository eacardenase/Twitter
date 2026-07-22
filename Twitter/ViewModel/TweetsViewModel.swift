//
//  TweetsViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import SwiftUI

@Observable
class TweetsViewModel {
    private let user: User

    init(user: User) {
        self.user = user
    }

    var profileImageUrl: URL {
        user.profileImageUrl
    }
}
