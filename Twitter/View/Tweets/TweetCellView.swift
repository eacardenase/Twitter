//
//  TweetCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/9/26.
//

import SwiftUI

struct TweetCellView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 16) {
                Image(.batman)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(.circle)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline.bold())

                        Group {
                            Text("@batman")

                            Text("•")

                            Text("2w")
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }

                    Text(
                        "It's not who I am underneath, but what I do that defines me"
                    )
                }
            }
            .padding(.bottom, 8)

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

            Divider()
        }
        .padding(.top)
    }
}

#Preview {
    TweetCellView()
}
