//
//  ContentView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            TabView {
                Tab("Home", systemImage: "house") {
                    FeedView()
                }

                Tab("Search", systemImage: "magnifyingglass") {
                    SearchView()
                }

                Tab("Messages", systemImage: "envelope") {
                    ConversationsView(path: $path)
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Conversation.self) { conversation in
                ChatView(conversation: conversation)
            }
            .navigationDestination(for: MockUser.self) { user in
                Text(user.username)
            }
        }
    }
}

#Preview {
    ContentView()
}
