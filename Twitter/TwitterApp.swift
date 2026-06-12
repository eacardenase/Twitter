//
//  TwitterApp.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import SwiftUI

@main
struct TwitterApp: App {
    @State private var router = Router()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
        }
    }
}
