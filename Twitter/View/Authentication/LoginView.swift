//
//  LoginView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/4/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.twitterBlue
                    .ignoresSafeArea()

                VStack(spacing: 32) {
                    Image(.twitterLogo)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 100)

                    VStack(spacing: 24) {
                        CustomTextField(
                            text: $email,
                            placeholder: "Email",
                            image: Image(systemName: "envelope")
                        )

                        CustomTextField(
                            text: $password,
                            placeholder: "Password",
                            image: Image(systemName: "lock"),
                            isSecure: true
                        )

                        HStack {
                            Spacer()

                            Button {
                                // TODO: Implement Action
                            } label: {
                                Text("Forgot Password?")
                                    .foregroundStyle(.white)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                        }

                        AuthenticationButton(title: "Sign In") {
                            // TODO: Implement Action
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    NavigationLink {
                        RegistrationView()
                    } label: {
                        HStack(spacing: 4) {
                            Text("Don't have an account?")

                            Text("Sign Up")
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.white)
                        .font(.callout)
                    }
                }
                .padding()
            }
        }
        .tint(.white)
    }
}

#Preview {
    LoginView()
}
