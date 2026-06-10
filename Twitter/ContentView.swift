//
//  ContentView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                NavigationStack {
                    FeedView()
                        .navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }

            Tab("Search", systemImage: "magnifyingglass") {
                NavigationStack {
                    List {

                    }
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }

            Tab("Messages", systemImage: "envelope") {
                NavigationStack {
                    List {

                    }
                    .navigationTitle("Messages")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
