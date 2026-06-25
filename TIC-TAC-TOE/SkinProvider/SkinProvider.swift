//
//  SkinProvider.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 25.06.2026.
//

import Foundation

final class SkinProvider {

    static let shared = SkinProvider()

    let skins: [Skin] = [
        Skin(xImage: "Xskin1", oImage: "Oskin1"),
        Skin(xImage: "Xskin2", oImage: "Oskin2"),
        Skin(xImage: "Xskin3", oImage: "Oskin3"),
        Skin(xImage: "Vector-1", oImage: "Vector-2"),
        Skin(xImage: "Oskin4", oImage: "Xskin4"),
        Skin(xImage: "Oskin5", oImage: "Xskin5")
    ]

    func currentSkin() -> Skin {
        let index = SettingsStorage.shared.selectedSkinIndex
        let safeIndex = min(max(index, 0), skins.count - 1)
        return skins[safeIndex]
    }
}
