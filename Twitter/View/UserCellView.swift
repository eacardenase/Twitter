//
//  UserCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct UserCellView: View {
    let user: User

    var body: some View {
        HStack(spacing: 16) {
            UserProfileImageView(
                url: user.profileImageUrl,
                width: 56,
                height: 56
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(user.fullname)
            }

            Spacer()
        }
        .contentShape(.rect)
    }
}

#Preview {
    UserCellView(user: MOCK_USERS[0])
}
