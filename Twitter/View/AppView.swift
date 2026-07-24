//
//  AppView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/16/26.
//

import SwiftUI

struct AppView: View {
    @Bindable var router: Router

    var body: some View {
        TabView(selection: $router.selectedTab) {
            Tab("Home", systemImage: "house", value: .home) {
                NavigationStack(path: $router.homePath) {
                    FeedView()
                        .navigationDestination(for: Route.self) {
                            routeView($0)
                        }
                }
            }

            Tab(
                "Search",
                systemImage: "magnifyingglass",
                value: .search
            ) {
                NavigationStack(path: $router.searchPath) {
                    SearchView()
                        .navigationDestination(for: Route.self) {
                            routeView($0)
                        }
                }
            }

            Tab("Messages", systemImage: "envelope", value: .messages) {
                NavigationStack(path: $router.messagesPath) {
                    ConversationsView()
                        .navigationDestination(for: Route.self) {
                            routeView($0)
                        }
                }
            }
        }
        .tint(.twitterBlue)
    }

    @ViewBuilder
    private func routeView(_ route: Route) -> some View {
        switch route {
        case .tweet(let tweet):
            TweetDetailsView(tweet: tweet)
        case .conversation(let conversation):
            ChatView(conversation: conversation)
        case .profile(let user):
            ProfileView(user: user)
        }
    }
}
