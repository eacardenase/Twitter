//
//  Router.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import Foundation

enum Route: Hashable {
    case conversation(Conversation)
    case profile(MockUser)
}

@Observable
final class Router {
    var path: [Route] = []

    func navigate(to route: Route) {
        path.append(route)
    }

    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func popToRoot() {
        path.removeAll()
    }
}
