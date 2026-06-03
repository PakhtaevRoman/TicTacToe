//
//  AppRouter.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import Foundation

final class AppRouter: ObservableObject {
    
    @Published var path: [AppRoute] = []
    
    var current: AppRoute {
        path.last ?? .home
    }
    
    func push(_ route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        _ = path.popLast()
    }
    
    func reset() {
        path.removeAll()
    }
}
