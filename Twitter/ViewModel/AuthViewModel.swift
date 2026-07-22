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
    var isLoading = false
    var user: User?
    var error: Error?

    func verifyLogin() async {
        isLoading = true
        defer { isLoading = false }

        do throws(NetworkingError) {
            user = try await AuthService.verifyLogin()
        } catch {
            self.error = error

            switch error {
            case .decodingError:
                print("DEBUG: Decoding Error")
            case .serverError(let message):
                print("DEBUG: Faied to verify login with error: \(message)")
            }
        }
    }

    func logUserIn(withEmail email: String, password: String) async {
        isLoading = true
        defer { isLoading = false }

        do {
            user = try await AuthService.logUserIn(
                withEmail: email,
                password: password
            )
        } catch {
            self.error = error
        }
    }

    func logUserOut() {
        do {
            try AuthService.logUserOut()

            user = nil
        } catch {
            self.error = error
        }
    }

    func createUser(with credentials: AuthCredentials) async {
        isLoading = true
        defer { isLoading = false }

        do {
            user = try await AuthService.createrUser(with: credentials)
        } catch {
            self.error = error
        }
    }
}
