//
//  ChatView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<9) { _ in
                    Text("Message Cell")
                }
            }
        }
        .navigationTitle("venom")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ChatView()
    }
}
