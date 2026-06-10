//
//  MessagesView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ConversationsView: View {
    @State private var showSearchViewSheet = false
    @State private var tabbarVisibility = Visibility.visible

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<20) { _ in
                        NavigationLink {
                            ChatView(tabbarVisibility: $tabbarVisibility)
                        } label: {
                            ConversationCellView()
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
        .toolbar(tabbarVisibility, for: .tabBar)
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
