//
//  UserCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct UserCellView: View {
    let user: MockUser

    var body: some View {
        HStack(spacing: 16) {
            Image(user.image)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(.circle)

            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Text(user.name)
            }

            Spacer()
        }
    }
}

#Preview {
    UserCellView(user: MOCK_USERS[0])
}
