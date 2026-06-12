//
//  ChatView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ChatView: View {
    @State private var textInput = ""
    @Binding var tabbarVisibility: Visibility

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    ForEach(0..<19) { _ in
                        ChatBubble(
                            isFromCurrentUser: Int.random(in: 0...1) == 1
                        )
                    }
                }
            }

            Divider()

            MessageInputView(text: $textInput) {
                // TODO: Send message
            }
        }
        .navigationTitle("venom")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .scrollIndicators(.never)
        .onAppear {
            tabbarVisibility = .hidden
        }
        .onDisappear {
            withAnimation {
                tabbarVisibility = .visible
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatView(tabbarVisibility: .constant(.hidden))
    }
}
