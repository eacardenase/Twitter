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

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(users) { user in
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
        .task {
            do throws(NetworkingError) {
                users = try await UserService.fetchUsers()
            } catch {
                switch error {
                case .decodingError:
                    print("DEBUG: Failed to decode users")
                case .serverError(let message):
                    print("DEBUG: Failed to get users with error: \(message)")
                }
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
