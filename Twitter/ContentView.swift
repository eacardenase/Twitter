//
//  ContentView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(Router.self) private var router

    var body: some View {
        @Bindable var router = router

        TabView(selection: $router.selectedTab) {
            Tab("Home", systemImage: "house", value: .home) {
                NavigationStack(path: $router.homePath) {
                    FeedView()
                }
            }

            Tab("Search", systemImage: "magnifyingglass", value: .search) {
                NavigationStack(path: $router.searchPath) {
                    SearchView()
                        .navigationDestination(for: Route.self) { route in
                            routeView(route)
                        }
                }
            }

            Tab("Messages", systemImage: "envelope", value: .messages) {
                NavigationStack(path: $router.messagesPath) {
                    ConversationsView()
                        .navigationDestination(for: Route.self) { route in
                            routeView(route)
                        }
                }
            }
        }
    }

    @ViewBuilder
    private func routeView(_ route: Route) -> some View {
        switch route {
        case .conversation(let conversation):
            ChatView(conversation: conversation)
                .toolbar(.hidden, for: .tabBar)
        case .profile(let user):
            ProfileView(user: user)
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
