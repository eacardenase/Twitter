//
//  NewTweetView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/1/26.
//

import SwiftUI

struct NewTweetView: View {
    @State var viewModel: TweetsViewModel
    @Environment(\.dismiss) var dismiss
    @State private var tweetBody = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top, spacing: 16) {
                    UserProfileImageView(
                        url: viewModel.profileImageUrl,
                        width: 64,
                        height: 64
                    )

                    TextField(
                        "What's happening?",
                        text: $tweetBody,
                        axis: .vertical
                    )
                    .lineLimit(10, reservesSpace: true)
                }

                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Tweet")
                            .padding(.horizontal)
                            .padding(.vertical, 4)
                            .fontWeight(.bold)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .disabled(tweetBody.isEmpty)
                }
            }
        }
    }
}

#Preview {
    NewTweetView(viewModel: TweetsViewModel(user: MOCK_USERS[0]))
}
