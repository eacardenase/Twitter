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
    var users = [User]()

    init() {
        Task {
            await fetchUsers()
        }
    }

    func fetchUsers() async {
        do throws(NetworkingError) {
            users = try await UserService.fetchUsers()
        } catch {
            self.error = error
        }
    }
}
