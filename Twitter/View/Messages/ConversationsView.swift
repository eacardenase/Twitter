//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showSearchViewSheet = false
    @Environment(Router.self) private var router

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(MOCK_CONVERSATIONS) { conversation in
                        Button {
                            router.push(.conversation(conversation))
                        } label: {
                            ConversationCellView(conversation: conversation)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .scrollIndicators(.never)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)

            ActionButton(systemImageName: "envelope.open") {
                showSearchViewSheet = true
            }
        }
        .sheet(isPresented: $showSearchViewSheet) {
            NewMessageView()
        }
    }
}

#Preview {
    NavigationStack {
        ConversationsView()
            .environment(Router())
    }
}
