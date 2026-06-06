//
//  FeedView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            List {

            }

            Button {
                //
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(8)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.circle)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
