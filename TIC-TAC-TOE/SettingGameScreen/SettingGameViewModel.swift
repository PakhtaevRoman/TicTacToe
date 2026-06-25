//
//  SettingGameViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import Foundation

struct Skin: Identifiable {
    let id = UUID()
    let xImage: String
    let oImage: String
}

final class SettingGameViewModel: SettingGameViewModelProtocol {

    @Published var viewItem: SettingGameViewItem

    private let onNavigate: (AppRoute) -> Void
    private let returnRoute: AppRoute

    init(onNavigate: @escaping (AppRoute) -> Void, returnRoute: AppRoute) {
        self.onNavigate = onNavigate
        self.returnRoute = returnRoute

        let skins: [Skin] = [
            Skin(xImage: "Xskin1", oImage: "Oskin1"),
            Skin(xImage: "Xskin2", oImage: "Oskin2"),
            Skin(xImage: "Xskin3", oImage: "Oskin3"),
            Skin(xImage: "Vector-1", oImage: "Vector-2"),
            Skin(xImage: "Oskin4", oImage: "Xskin4"),
            Skin(xImage: "Oskin5", oImage: "Xskin5")
        ]

        // 👇 ЗАГРУЗКА ИЗ USERDEFAULTS
        let savedSkinIndex = SettingsStorage.shared.selectedSkinIndex
        let savedDuration = SettingsStorage.shared.selectedDuration
        let savedGameTime = SettingsStorage.shared.isGameTimeEnabled

        self.viewItem = SettingGameViewItem(
            skins: skins,
            selectedSkinIndex: savedSkinIndex,
            isGameTimeEnabled: savedGameTime,
            selectedDuration: savedDuration
        )
    }

    func didTapBack() {
        onNavigate(returnRoute)
    }

    func didSelectSkin(index: Int) {
        viewItem = SettingGameViewItem(
            skins: viewItem.skins,
            selectedSkinIndex: index,
            isGameTimeEnabled: viewItem.isGameTimeEnabled,
            selectedDuration: viewItem.selectedDuration
        )

        // 💾 SAVE
        SettingsStorage.shared.selectedSkinIndex = index
    }

    func didToggleGameTime() {
        let newValue = !viewItem.isGameTimeEnabled

        viewItem = SettingGameViewItem(
            skins: viewItem.skins,
            selectedSkinIndex: viewItem.selectedSkinIndex,
            isGameTimeEnabled: newValue,
            selectedDuration: viewItem.selectedDuration
        )

        // 💾 SAVE
        SettingsStorage.shared.isGameTimeEnabled = newValue
    }

    func didSelectDuration(_ option: DurationOption) {
        viewItem = SettingGameViewItem(
            skins: viewItem.skins,
            selectedSkinIndex: viewItem.selectedSkinIndex,
            isGameTimeEnabled: viewItem.isGameTimeEnabled,
            selectedDuration: option
        )

        // 💾 SAVE
        SettingsStorage.shared.selectedDuration = option
    }
}
