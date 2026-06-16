//
//  SettingGameViewItem.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import Foundation

struct SettingGameViewItem {
    let skins: [Skin]
    let selectedSkinIndex: Int?
    
    let isGameTimeEnabled: Bool
    let selectedDuration: DurationOption
}

enum DurationOption: String, CaseIterable {
    case min30 = "30 min"
    case min60 = "60 min"
    case min120 = "120 min"
}
