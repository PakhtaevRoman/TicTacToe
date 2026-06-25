//
//  GameModeStorage.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 25.06.2026.
//

import Foundation

enum GameMode: String {
    case single
    case twoPlayer
}

final class GameModeStorage {

    static let shared = GameModeStorage()
    private init() {}

    private let defaults = UserDefaults.standard

    private enum Keys {
        static let selectedMode = "selectedMode"
    }

    var selectedMode: GameMode {
        get {
            let raw = defaults.string(forKey: Keys.selectedMode)
            return GameMode(rawValue: raw ?? "") ?? .twoPlayer
        }
        set {
            defaults.set(newValue.rawValue, forKey: Keys.selectedMode)
        }
    }
}
