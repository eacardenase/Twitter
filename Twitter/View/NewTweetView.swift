//
//  NewTweetView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/1/26.
//

import SwiftUI

struct NewTweetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Text("Hello World")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }
                    }

                    ToolbarItem(placement: .confirmationAction) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Tweet")
                                .padding(.horizontal)
                                .fontWeight(.bold)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                    }
                }
        }
    }
}

#Preview {
    NewTweetView()
}
