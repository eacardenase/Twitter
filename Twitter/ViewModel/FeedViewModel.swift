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
            await fetchTweets()
        }
    }

    func fetchTweets() async {
        isLoading = true
        defer { isLoading = false }

        do throws(NetworkingError) {
            tweets = try await TweetsService.fetchTweets()
        } catch {
            self.error = error
        }
    }
}
