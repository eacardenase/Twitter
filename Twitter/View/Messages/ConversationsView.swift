//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showSearchViewSheet = false
    @State private var viewModel = ConversationsViewModel()
    @Environment(Router.self) private var router

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Group {
                if !viewModel.isEmpty {
                    ScrollView {
                        VStack {
                            ForEach(viewModel.conversations) {
                                let conversationCellViewModel =
                                    ConversationCellViewModel(conversation: $0)

                                let chatViewModel = ChatViewModel(
                                    user: conversationCellViewModel.chatPartner
                                )

                                Button {
                                    router.push(.chat(chatViewModel))
                                } label: {
                                    ConversationCellView(
                                        viewModel: conversationCellViewModel
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding()
                    }
                    .scrollIndicators(.never)
                } else {
                    ContentUnavailableView(
                        "No chats found",
                        systemImage: "info.circle",
                        description: Text("Try starting a new conversation")
                    )
                }
            }
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)

            ActionButton(systemImageName: "envelope.open") {
                showSearchViewSheet = true
            }
        }
        .sheet(isPresented: $showSearchViewSheet) {
            NewMessageView()
        }
        .task {
            await viewModel.fetchConversations()
        }
    }
}

#Preview {
    NavigationStack {
        ConversationsView()
            .environment(Router())
    }
}
