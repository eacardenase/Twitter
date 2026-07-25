//
//  TweetActionsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/24/26.
//

import SwiftUI

struct TweetActionsView: View {
    var body: some View {
        HStack {
            Button {

            } label: {
                Image(systemName: "bubble.left")
                    .frame(width: 32, height: 32)
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "arrow.2.squarepath")
                    .frame(width: 32, height: 32)
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "heart")
                    .frame(width: 32, height: 32)
            }

            Spacer()

            Button {

            } label: {
                Image(systemName: "bookmark")
                    .frame(width: 32, height: 32)
            }
        }
        .font(.title3)
        .foregroundStyle(.secondary)
    }
}

#Preview {
    TweetActionsView()
}
