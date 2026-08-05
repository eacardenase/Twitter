//
//  SearchViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/17/26.
//

import Foundation

@Observable
class SearchViewModel {
    var error: Error?
    var isLoading = false
    private var users = [User]()
    var searchText: String = ""
    var query: String {
        searchText.lowercased()
    }

    var filteredUsers: [User] {
        if query.isEmpty {
            return users
        }

        return users.filter {
            $0.username.contains(query)
                || $0.fullname.lowercased().contains(query)
        }
    }

    func fetchUsers() async {
        isLoading = true
        defer { isLoading = false }

        do throws(NetworkingError) {
            users = try await UserService.fetchUsers()
        } catch {
            self.error = error
        }
    }
}
