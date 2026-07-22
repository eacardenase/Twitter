//
//  FeedView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct FeedView: View {
    @State private var isPresentingNewTweetView = false
    @State private var isPresentingLogOutAlert = false
    @Environment(AuthViewModel.self) var viewModel

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack {
                    ForEach(0..<10) { _ in
                        TweetCellView()
                    }
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)

            ActionButton(systemImageName: "plus") {
                isPresentingNewTweetView.toggle()
            }
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $isPresentingNewTweetView) {
            NewTweetView()
        }
        .alert("Log Out?", isPresented: $isPresentingLogOutAlert) {
            Button("Log Out", role: .destructive) {
                withAnimation(.easeInOut) {
                    viewModel.logUserOut()
                }
            }

            Button("Cancel", role: .cancel) {}
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isPresentingLogOutAlert.toggle()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
