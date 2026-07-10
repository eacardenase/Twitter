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

    func registerUser(
        email: String,
        password: String,
        username: String,
        fullname: String,
        profileImage: Image
    ) {
        Auth.auth().createUser(withEmail: email, password: password) {
            result,
            error in
            if let error {
                print(
                    "DEBUG: Failed to create user with error: \(error.localizedDescription)"
                )

                return
            }

            print("DEBUG: Successfully created user with email: \(email)")
        }
    }
}
