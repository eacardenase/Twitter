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
                            route in
                            routeView(route)
                        }
                }
            }

            Tab("Messages", systemImage: "envelope", value: .messages) {
                NavigationStack(path: $router.messagesPath) {
                    ConversationsView()
                        .navigationDestination(for: Route.self) {
                            route in
                            routeView(route)
                        }
                }
            }
        }
        .tint(.twitterBlue)
    }

    @ViewBuilder
    private func routeView(_ route: Route) -> some View {
        switch route {
        case .conversation(let conversation):
            ChatView(conversation: conversation)
        case .profile(let user):
            ProfileView(user: user)
        }
    }
}
