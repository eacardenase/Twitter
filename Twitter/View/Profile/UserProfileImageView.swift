//
//  UserProfileImageView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/17/26.
//

import SwiftUI

struct UserProfileImageView: View {
    let url: URL
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipShape(.circle)
        } placeholder: {
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.3).gradient)
                    .frame(width: height, height: height)
                    .clipShape(.circle)

                ProgressView()
                    .tint(.gray)
            }
        }
    }
}

#Preview {
    UserProfileImageView(
        url: MOCK_USERS[0].profileImageUrl,
        width: 120,
        height: 120
    )
}
