//
//  ActionButton.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/10/26.
//

import SwiftUI

struct ActionButton: View {
    let systemImageName: String
    let action: () -> Void

    var body: some View {
        Button {
            //
        } label: {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .padding(8)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.circle)
        .padding()
    }
}

#Preview {
    ActionButton(systemImageName: "plus") {
        //
    }
}
