//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showSearchViewSheet = false
    @Binding var path: NavigationPath

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(MOCK_CONVERSATIONS) { conversation in
                        NavigationLink(value: conversation) {
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
            NewMessageView { user in
                let conversation = Conversation(user: user, messages: [])

                path.append(conversation)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ConversationsView(path: .constant(.init()))
    }
}
