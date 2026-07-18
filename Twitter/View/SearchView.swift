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
    @State private var users = [User]()
    @State private var viewModel = SearchViewModel()

    var body: some View {
        Group {
            if !viewModel.users.isEmpty {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.users) { user in
                            Button {
                                router.push(.profile(user))
                            } label: {
                                UserCellView(user: user)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            } else {
                ContentUnavailableView(
                    "No users found",
                    systemImage: "magnifyingglass"
                )
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
