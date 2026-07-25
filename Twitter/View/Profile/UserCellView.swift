//
//  UserCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct UserCellView: View {
    let viewModel: ProfileViewModel

    var body: some View {
        HStack(spacing: 16) {
            UserProfileImageView(
                url: viewModel.profileImageUrl,
                width: 56,
                height: 56
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(viewModel.fullname)
            }

            Spacer()
        }
        .contentShape(.rect)
    }
}

#Preview {
    UserCellView(viewModel: ProfileViewModel(user: MOCK_USERS[0]))
}
