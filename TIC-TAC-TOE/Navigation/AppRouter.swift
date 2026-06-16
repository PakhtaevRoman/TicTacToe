//
//  AppRouter.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

//import Foundation
//
//final class AppRouter: ObservableObject {
//
//    @Published var path: [AppRoute] = []
//
//    var current: AppRoute {
//        path.last ?? .home
//    }
//
//    func push(_ route: AppRoute) {
//        path.append(route)
//    }
//
//    func pop() {
//        _ = path.popLast()
//    }
//
//    func reset() {
//        path.removeAll()
//    }
//}

import Foundation
import Combine

final class AppRouter: ObservableObject {

    @Published var currentRoute: AppRoute? = .home

    func push(_ route: AppRoute) {
        guard currentRoute != route else { return }
        currentRoute = route
    }

    func pop() {
        currentRoute = .home
    }

    func reset() {
        currentRoute = .home
    }
}
