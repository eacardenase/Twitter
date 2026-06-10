//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showSearchViewSheet = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        NavigationLink {
                            ChatView()
                        } label: {
                            ConversationCellView()
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .scrollIndicators(.never)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .padding()

            ActionButton(systemImageName: "envelope.open") {
                showSearchViewSheet = true
            }
        }
        .sheet(isPresented: $showSearchViewSheet) {
            NavigationStack {
                SearchView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ConversationsView()
    }
}
