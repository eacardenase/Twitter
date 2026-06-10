//
//  UserCellView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct UserCellView: View {
    var body: some View {
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

                Text("Eddie Brock")
            }

            Spacer()
        }
    }
}

#Preview {
    UserCellView()
}
