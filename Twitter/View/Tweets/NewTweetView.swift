//
//  NewTweetView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/1/26.
//

import SwiftUI

struct NewTweetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var tweetBody = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top, spacing: 16) {
                    Image(.batman)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(.circle)

                    TextField(
                        "What's happening?",
                        text: $tweetBody,
                        axis: .vertical
                    )
                    .lineLimit(10, reservesSpace: true)
                }
                .padding(.top)

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
                }
            }
        }
    }
}

#Preview {
    NewTweetView()
}
