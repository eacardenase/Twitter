//
//  AuthenticationButton.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/8/26.
//

import SwiftUI

struct AuthenticationButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .tint(.twitterBlue)
                .frame(maxWidth: .infinity)
                .font(.headline)
                .padding(.vertical)
                .background(.white)
                .clipShape(.capsule)
        }
    }
}

#Preview {
    ZStack {
        Color.twitterBlue
            .ignoresSafeArea()

        AuthenticationButton(title: "Sign Up") {}
            .padding()
    }
}
