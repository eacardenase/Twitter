//
//  TwitterApp.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/5/26.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication
            .LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct TwitterApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var router = Router()
    @State private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(router)
                .environment(authViewModel)
        }
    }
}
