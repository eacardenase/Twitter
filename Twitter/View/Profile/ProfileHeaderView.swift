//
//  ProfileHeaderView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Bindable var viewModel: ProfileViewModel

    var body: some View {
        VStack(spacing: 0) {
            UserProfileImageView(
                url: viewModel.profileImageUrl,
                width: 120,
                height: 120
            )

            Text(viewModel.fullname)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.top, 8)

            Text("@\(viewModel.username)")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Billionaire by day, dark knight by night")
                .padding(.top, 8)

            ProfileStatisticsView()

            ProfileActionView(viewModel: viewModel)
        }
    }
}

#Preview {
    ProfileHeaderView(viewModel: ProfileViewModel(user: MOCK_USERS[0]))
        .environment(Router())
}
