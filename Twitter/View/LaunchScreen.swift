//
//  LaunchScreen.swift
//  Twitter
//
//  Created by Edwin Cardenas on 7/16/26.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Color.twitterBlue.ignoresSafeArea()

            Image(.twitterLogo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    LaunchScreen()
}
