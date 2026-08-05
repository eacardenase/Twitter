//
//  ConversationCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationCellView: View {
    @Bindable var viewModel: ConversationCellViewModel

    var body: some View {
        VStack {
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

                    Text(viewModel.text)
                        .lineLimit(2, reservesSpace: true)
                }

                Spacer()
            }
            .contentShape(.rect)

            Divider()
        }
    }
}

#Preview {
    ConversationCellView(
        viewModel: ConversationCellViewModel(
            conversation: MOCK_CONVERSATIONS[0]
        )
    )
}
