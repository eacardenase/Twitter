//
//  LoginView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/4/26.
//

import SwiftUI

struct LoginView: View {
    enum Field: Hashable {
        case email
        case password
    }

    @State private var email = ""
    @State private var password = ""
    @Environment(AuthViewModel.self) var viewModel
    @FocusState private var focusedField: Field?

    var body: some View {
        NavigationStack {
            ZStack {
                Color.twitterBlue
                    .ignoresSafeArea()
                    .onTapGesture {
                        focusedField = nil
                    }

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
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: .email)

                        CustomTextField(
                            text: $password,
                            placeholder: "Password",
                            image: Image(systemName: "lock"),
                            isSecure: true
                        )
                        .keyboardType(.asciiCapable)
                        .textInputAutocapitalization(.never)
                        .focused($focusedField, equals: .email)

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
                            Task {
                                await viewModel.logUserIn(
                                    withEmail: email,
                                    password: password
                                )
                            }
                        }
                    }
                    .padding(.horizontal)

                    Spacer()

                    NavigationLink {
                        RegistrationView()
                            .navigationBarBackButtonHidden()
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
    }
}

#Preview {
    LoginView()
        .environment(AuthViewModel())
}
