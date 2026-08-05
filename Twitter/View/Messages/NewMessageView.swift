//
//  NewMessageView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import SwiftUI

struct NewMessageView: View {
    @State private var viewModel = SearchViewModel()
    @Environment(\.dismiss) var dismiss
    @Environment(Router.self) private var router

    var body: some View {
        NavigationStack {
            Group {
                if !viewModel.isEmpty {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(viewModel.filteredUsers) { user in
                                let profileViewModel = UserViewModel(user: user)
                                let chatViewModel = ChatViewModel(user: user)

                                Button {
                                    dismiss()

                                    Task { @MainActor in
                                        router.push(.chat(chatViewModel))
                                    }
                                } label: {
                                    UserCellView(viewModel: profileViewModel)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    .padding(.horizontal)
                } else {
                    ContentUnavailableView(
                        "No users found",
                        systemImage: "magnifyingglass"
                    )
                }
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                Task {
                    await viewModel.fetchUsers()
                }
            }
        }

    }
}

#Preview {
    NewMessageView()
        .environment(Router())
}
