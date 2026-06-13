//
//  Router.swift
//  Twitter
//
//  Created by Edwin Cardenas on 6/12/26.
//

import Foundation

enum AppTab: Codable, Hashable {
    case home
    case search
    case messages
}

enum Route: Codable, Hashable {
    case conversation(Conversation)
    case profile(MockUser)
}

private struct RouterState: Codable {
    let selectedTab: AppTab
    let homePath: [Route]
    let searchPath: [Route]
    let messagesPath: [Route]
}

@Observable
final class Router {
    var selectedTab: AppTab = .home {
        didSet {
            save()
        }
    }

    var homePath: [Route] = []
    var searchPath: [Route] = []
    var messagesPath: [Route] = []

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    func push(_ route: Route) {
        switch selectedTab {
        case .home:
            homePath.append(route)
        case .search:
            searchPath.append(route)
        case .messages:
            messagesPath.append(route)
        }

        save()
    }

    init() {
        guard
            let data = try? Data(contentsOf: savePath),
            let state = try? JSONDecoder().decode(
                RouterState.self,
                from: data
            )
        else {
            return
        }

        selectedTab = state.selectedTab
        homePath = state.homePath
        searchPath = state.searchPath
        messagesPath = state.messagesPath
    }

    func save() {
        do {
            let state = RouterState(
                selectedTab: selectedTab,
                homePath: homePath,
                searchPath: searchPath,
                messagesPath: messagesPath
            )

            let data = try JSONEncoder().encode(state)

            try data.write(to: savePath)

        } catch {
            print("Failed to save router state: \(error)")
        }
    }
}
