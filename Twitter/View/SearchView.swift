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
                ForEach(0..<10) { _ in
                    UserCellView()
                }
            }
        }
        .scrollIndicators(.never)
        .padding(.horizontal)
        .searchable(text: $searchText)
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
