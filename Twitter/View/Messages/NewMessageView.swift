//
//  NewMessageView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @Environment(Router.self) private var router

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(MOCK_USERS) { user in
                        Button {
                            dismiss()

                            Task { @MainActor in
                                let conversation = Conversation(
                                    user: user,
                                    messages: []
                                )

                                router.navigate(to: .conversation(conversation))
                            }
                        } label: {
                            UserCellView(user: user)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .scrollIndicators(.never)
            .padding(.horizontal)
            .searchable(text: $searchText)
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

#Preview {
    NewMessageView()
        .environment(Router())
}
