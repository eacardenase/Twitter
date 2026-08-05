//
//  SearchView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct SearchView: View {
    @Environment(Router.self) var router
    @State private var viewModel = SearchViewModel()

    var body: some View {
        Group {
            if !viewModel.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.filteredUsers) {
                            let profileViewModel = UserViewModel(user: $0)

                            Button {
                                router.push(.profile(profileViewModel))
                            } label: {
                                UserCellView(viewModel: profileViewModel)
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
        .searchable(text: $viewModel.searchText)
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: viewModel.searchText) { oldValue, newValue in
            Task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    NavigationStack {
        SearchView()
            .environment(Router())
    }
}
