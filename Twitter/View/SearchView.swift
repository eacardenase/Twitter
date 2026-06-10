//
//  SearchView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0..<3) { _ in
                    HStack(alignment: .center) {
                        Image(.batman)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 56, height: 56)
                            .clipShape(.circle)

                        VStack(alignment: .leading) {
                            Text("batman")
                                .font(.subheadline.bold())

                            Text("Bruce Wayne")
                                .font(.subheadline)
                        }

                        Spacer()
                    }
                }
            }
        }
        .padding(.horizontal)
        .searchable(text: $searchText)
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
