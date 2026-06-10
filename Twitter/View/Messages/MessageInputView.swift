//
//  MessageInputView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var text: String
    let action: () -> Void

    var body: some View {
        HStack {
            TextField("Message...", text: $text)

            Button {
                action()
            } label: {
                Text("Send")
                    .fontWeight(.bold)
            }
        }
        .padding()
        .frame(minHeight: 30)
    }
}

#Preview {
    MessageInputView(text: .constant("")) {
        //
    }
}
