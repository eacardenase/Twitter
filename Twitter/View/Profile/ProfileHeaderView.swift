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

            ProfileStatisticsView()

            ProfileActionView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: MOCK_USERS[0])
        .environment(Router())
}
