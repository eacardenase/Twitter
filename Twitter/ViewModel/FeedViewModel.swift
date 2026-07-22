//
//  FeedViewModel.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/22/26.
//

import SwiftUI

@Observable
class FeedViewModel {
    var tweets = [Tweet]()
    var isLoading = false
    var error: Error?

    init() {
        Task {
            await fetchAllTweets()
        }
    }

    func fetchAllTweets() async {
        isLoading = true
        defer { isLoading = false }

        do throws(NetworkingError) {
            tweets = try await TweetsService.fetchAllTweets()
        } catch {
            self.error = error
        }
    }
}
