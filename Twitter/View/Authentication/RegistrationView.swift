//
//  RegistrationView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/4/26.
//

import SwiftUI

struct RegistrationView: View {
    @State private var fullname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isImagePickerPresented = false
    @State private var selectedUIImage: UIImage?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.twitterBlue
                .ignoresSafeArea()

            VStack(spacing: 32) {
                Button {
                    isImagePickerPresented.toggle()
                } label: {
                    Group {
                        if let selectedUIImage {
                            Image(uiImage: selectedUIImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 200)
                                .clipShape(.circle)
                        } else {
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .frame(width: 200)
                        }
                    }
                }

                VStack(spacing: 24) {
                    CustomTextField(
                        text: $fullname,
                        placeholder: "Full Name",
                        image: Image(systemName: "person")
                    )

                    CustomTextField(
                        text: $fullname,
                        placeholder: "Username",
                        image: Image(systemName: "at")
                    )

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

                    AuthenticationButton(title: "Sign Up") {
                        // TODO: Implement Action
                    }
                }
                .padding(.horizontal)

                Spacer()

                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Text("Already have an account?")

                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .font(.callout)
                }
            }
            .padding()
        }
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedUIImage)
        }
    }
}

#Preview {
    RegistrationView()
}
