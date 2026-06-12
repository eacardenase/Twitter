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
    var onUserSelected: (MockUser) -> Void

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(MOCK_USERS) { user in
                        Button {
                            dismiss()

                            DispatchQueue.main.async {
                                onUserSelected(user)
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
    NewMessageView { print($0.username) }
}
