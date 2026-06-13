//
//  Router.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import Foundation

enum AppTab: Hashable {
    case home
    case search
    case messages
}

enum Route: Hashable {
    case conversation(Conversation)
    case profile(MockUser)
}

@Observable
final class Router {
    var selectedTab: AppTab = .home

    var homePath: [Route] = []
    var searchPath: [Route] = []
    var messagesPath: [Route] = []

    func push(_ route: Route) {
        switch selectedTab {
        case .home:
            homePath.append(route)
        case .search:
            searchPath.append(route)
        case .messages:
            messagesPath.append(route)
        }
    }
}
