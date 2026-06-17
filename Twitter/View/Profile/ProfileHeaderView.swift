//
//  ProfileHeaderView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: MockUser

    var body: some View {
        VStack(spacing: 0) {
            Image(user.image)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(.circle)
                .shadow(radius: 10)

            Text(user.name)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.top, 8)

            Text("@\(user.username)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Billionaire by day, dark knight by night")
                .padding(.top, 8)

            HStack(spacing: 32) {
                VStack(spacing: 0) {
                    Text("0")
                        .font(.title.bold())

                    Text("Followers")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }

                VStack(spacing: 0) {
                    Text("1")
                        .font(.title.bold())

                    Text("Following")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()

            HStack(spacing: 16) {
                ProfileActionButtonView(title: "Follow") {
                    // TODO:
                }
                .tint(.blue)

                ProfileActionButtonView(title: "Message") {
                    // TODO:
                }
                .tint(.purple)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileHeaderView(user: MOCK_USERS[0])
}
