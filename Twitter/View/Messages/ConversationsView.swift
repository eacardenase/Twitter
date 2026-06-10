//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        ConversationCellView()
                    }
                }
            }
            .scrollIndicators(.never)
            .navigationTitle("Messages")
            .navigationBarTitleDisplayMode(.inline)
            .padding()

            ActionButton(systemImageName: "envelope.open") {
                // TODO: Implement action
            }
        }
    }
}

#Preview {
    NavigationStack {
        ConversationsView()
    }
}
