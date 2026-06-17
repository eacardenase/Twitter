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
        case .replies: "Tweets & Replies"
        case .likes: "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOption

    private let underlineWidth =
        UIScreen.main.bounds.width / CGFloat(TweetFilterOption.allCases.count)

    private var optionPadding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue)
        let count = CGFloat(TweetFilterOption.allCases.count)

        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOption.allCases, id: \.self) { option in
                    Button {
                        selectedOption = option
                    } label: {
                        Text(option.title)
                            .foregroundStyle(.blue)
                            .frame(width: underlineWidth)
                    }
                }
            }

            Rectangle()
                .fill(.blue)
                .frame(
                    width: underlineWidth - 32,
                    height: 3,
                    alignment: .center
                )
                .padding(.leading, optionPadding)
                .animation(.spring)
        }
        .padding()
    }
}

#Preview {
    FilterButtonView(selectedOption: .constant(.likes))
}
