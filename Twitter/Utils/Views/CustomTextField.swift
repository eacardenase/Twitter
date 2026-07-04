//
//  CustomTextField.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/4/26.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "envelope")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)

            TextField(
                placeholder,
                text: $text,
                prompt: Text(placeholder).foregroundStyle(
                    .white.opacity(0.6)
                )
            )
            .tint(Color.twitterBlue)
            .foregroundStyle(.white)
            .textInputAutocapitalization(.never)
        }
        .padding()
        .background(.white.opacity(0.15))
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    ZStack {
        Color.twitterBlue
            .ignoresSafeArea()

        CustomTextField(
            text: .constant(""),
            placeholder: "Email"
        )
        .padding()
    }
}
