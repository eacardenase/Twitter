//
//  ProfileStatisticsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileStatisticsView: View {
    @Bindable var viewModel: UserViewModel

    var body: some View {
        HStack(spacing: 32) {
            VStack(spacing: 0) {
                Text(viewModel.followersCount)
                    .font(.title.bold())

                Text("Followers")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VStack(spacing: 0) {
                Text(viewModel.followingCount)
                    .font(.title.bold())

                Text("Following")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileStatisticsView(viewModel: UserViewModel(user: MOCK_USERS[0]))
}
