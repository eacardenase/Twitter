//
//  RegistrationView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/4/26.
//

import PhotosUI
import SwiftUI

struct RegistrationView: View {
    enum Field: Hashable {
        case fullname
        case username
        case email
        case password
    }

    @State private var fullname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var uiImage: UIImage?
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusedField: Field?
    @Environment(AuthViewModel.self) var viewModel
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Color.twitterBlue
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }

            VStack(spacing: 32) {
                PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.15))

                        if let uiImage {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .clipShape(.circle)
                        } else {
                            Image(systemName: "photo.on.rectangle")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 120, height: 120)
                        }
                    }
                    .frame(width: 200, height: 200)
                }

                VStack(spacing: 24) {
                    CustomTextField(
                        text: $fullname,
                        placeholder: "Full Name",
                        image: Image(systemName: "person")
                    )
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.words)
                    .focused($focusedField, equals: .fullname)

                    CustomTextField(
                        text: $username,
                        placeholder: "Username",
                        image: Image(systemName: "at")
                    )
                    .keyboardType(.asciiCapable)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: .username)

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
                    .focused($focusedField, equals: .password)

                    AuthenticationButton(title: "Sign Up") {
                        guard let uiImage else {
                            showAlert.toggle()

                            return
                        }

                        let credentials = AuthCredentials(
                            fullname: fullname,
                            username: username.lowercased(),
                            email: email,
                            password: password,
                            profileImage: uiImage
                        )

                        Task {
                            await viewModel.createUser(with: credentials)
                        }
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
        .alert("Profile Photo", isPresented: $showAlert) {
        } message: {
            Text("Please provide an image to be used as profile photo.")
        }
        .onChange(of: selectedPhotoItem) {
            guard let selectedPhotoItem else { return }

            selectedPhotoItem.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data, let uiImage = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.uiImage = uiImage
                        }
                    }
                case .failure(let error):
                    print("DEBUG:", error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    RegistrationView()
        .environment(AuthViewModel())
}
