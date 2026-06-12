//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    @Binding var path: NavigationPath
    @State private var showSearchViewSheet = false

    var body: some View {
        NavigationStack(path: $path) {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack {
                        ForEach(MOCK_CONVERSATIONS) { conversation in
                            Button {
                                path.append(conversation.user)
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
                NewMessageView(path: $path)
            }
            .navigationDestination(for: MockUser.self) { user in
                ChatView(user: user)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ConversationsView(path: .constant(.init()))
    }
}
