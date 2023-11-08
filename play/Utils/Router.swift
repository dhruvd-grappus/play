//
//  Router.swift
//  play
//
//  Created by Dhruv on 31/10/23.
//

import Foundation
import SwiftUI
final class Router: ObservableObject {
    public enum Destination: Codable, Hashable {
        case login
        case profile
        case feed
        case detail
    }

    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
