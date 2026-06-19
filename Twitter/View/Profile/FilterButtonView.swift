//
//  FilterButtonView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/17/26.
//

import SwiftUI

enum TweetFilterOption: Int, CaseIterable {
    case all
    case replies
    case likes

    var title: String {
        switch self {
        case .all: "Tweets"
        case .replies: "Replies"
        case .likes: "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOption
    @State private var contentWidth: CGFloat = 0

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                ForEach(TweetFilterOption.allCases, id: \.self) { option in
                    Button {
                        withAnimation {
                            selectedOption = option
                        }
                    } label: {
                        VStack {
                            Text(option.title)
                                .foregroundStyle(.blue)

                            Rectangle()
                                .fill(option == selectedOption ? .blue : .clear)
                                .frame(height: 3)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    FilterButtonView(selectedOption: .constant(.all))
}
