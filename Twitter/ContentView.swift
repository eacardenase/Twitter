//
//  ContentView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(Router.self) private var router
    @Environment(AuthViewModel.self) private var viewModel

    var body: some View {
        @Bindable var router = router

        Group {
            if viewModel.isLoading {
                LaunchScreen()
            } else if viewModel.user != nil {
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
            } else {
                LoginView()
            }
        }
        .task {
            await viewModel.verifyLogin()
        }
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

#Preview {
    ContentView()
        .environment(Router())
        .environment(AuthViewModel())
}
