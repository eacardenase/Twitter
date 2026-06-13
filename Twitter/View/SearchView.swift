//
//  SearchView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @Environment(Router.self) var router

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(MOCK_USERS) { user in
                    Button {
                        router.push(.profile(user))
                    } label: {
                        UserCellView(user: user)
                    }
                    .buttonStyle(.plain)
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
            .environment(Router())
    }
}
