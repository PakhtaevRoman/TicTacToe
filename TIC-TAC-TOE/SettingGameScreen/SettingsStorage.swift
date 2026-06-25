//
//  SettingsStorage.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 23.06.2026.
//

import Foundation

final class SettingsStorage {

    static let shared = SettingsStorage()
    private init() {}

    private let defaults = UserDefaults.standard

    private enum Keys {
        static let isGameTimeEnabled = "isGameTimeEnabled"
        static let selectedDuration = "selectedDuration"
        static let selectedSkinIndex = "selectedSkinIndex"
    }

    var isGameTimeEnabled: Bool {
        get { defaults.bool(forKey: Keys.isGameTimeEnabled) }
        set { defaults.set(newValue, forKey: Keys.isGameTimeEnabled) }
    }

    var selectedDuration: DurationOption {
        get {
            let raw = defaults.string(forKey: Keys.selectedDuration)
            return DurationOption(rawValue: raw ?? "") ?? .min30
        }
        set {
            defaults.set(newValue.rawValue, forKey: Keys.selectedDuration)
        }
    }

    var selectedSkinIndex: Int {
        get {
            let value = defaults.integer(forKey: Keys.selectedSkinIndex)
            return value
        }
        set {
            defaults.set(newValue, forKey: Keys.selectedSkinIndex)
        }
    }
}
