//
//  ConversationCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationCellView: View {
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(.venom10)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(.circle)

                VStack(alignment: .leading, spacing: 4) {
                    Text("venom")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    Text(
                        "Longer message text to see what happens when I do this"
                    )
                    .lineLimit(2, reservesSpace: true)
                }

                Spacer()
            }

            Divider()
        }
    }
}

#Preview {
    ConversationCellView()
}
