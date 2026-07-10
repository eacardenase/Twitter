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
    let image: Image
    var isSecure: Bool = false

    var body: some View {
        HStack(spacing: 16) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(.white)

            Group {
                if isSecure {
                    SecureField(
                        placeholder,
                        text: $text,
                        prompt: Text(placeholder).foregroundStyle(
                            .white.opacity(0.6)
                        )
                    )
                } else {
                    TextField(
                        placeholder,
                        text: $text,
                        prompt: Text(placeholder).foregroundStyle(
                            .white.opacity(0.6)
                        )
                    )
                }
            }
            .tint(.white)
            .foregroundStyle(.white)
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
            placeholder: "Email",
            image: Image(systemName: "envelope"),
        )
        .padding()
    }
}
