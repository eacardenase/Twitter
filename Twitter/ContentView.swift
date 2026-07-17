//
//  ContentView.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(Router.self) private var router
    @Environment(AuthViewModel.self) private var viewModel

    var body: some View {
        ZStack {
            if viewModel.user != nil {
                AppView(router: router)
            } else {
                LoginView()
            }

            if viewModel.isLoading {
                LaunchScreen()
                    .ignoresSafeArea()
            }
        }
        .task {
            await viewModel.verifyLogin()
        }
    }
}

#Preview {
    ContentView()
        .environment(Router())
        .environment(AuthViewModel())
}
