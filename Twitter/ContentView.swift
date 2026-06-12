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

        NavigationStack(path: $router.path) {
            TabView {
                Tab("Home", systemImage: "house") {
                    FeedView()
                }

                Tab("Search", systemImage: "magnifyingglass") {
                    SearchView()
                }

                Tab("Messages", systemImage: "envelope") {
                    ConversationsView()
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .conversation(let conversation):
                    ChatView(conversation: conversation)
                case .profile(let user):
                    Text(user.username)
                }

            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
}
