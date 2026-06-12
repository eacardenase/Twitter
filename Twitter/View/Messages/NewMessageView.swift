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
    @Binding var path: NavigationPath

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(MOCK_USERS) { user in
                        Button {
                            dismiss()

                            path.append(user)
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
    NewMessageView(path: .constant(.init()))
}
