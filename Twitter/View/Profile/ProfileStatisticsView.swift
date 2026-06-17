//
//  ProfileStatisticsView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

struct ProfileStatisticsView: View {
    var body: some View {
        HStack(spacing: 32) {
            VStack(spacing: 0) {
                Text("0")
                    .font(.title.bold())

                Text("Followers")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            VStack(spacing: 0) {
                Text("1")
                    .font(.title.bold())

                Text("Following")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview {
    ProfileStatisticsView()
}
