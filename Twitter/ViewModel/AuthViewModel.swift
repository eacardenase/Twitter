//
//  AuthViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/10/26.
//

import FirebaseAuth
import SwiftUI

@Observable
class AuthViewModel {
    func login() {

    }

    func createUser(with credentials: AuthCredentials) async throws {
        try await AuthService.createrUser(with: credentials)
    }
}
