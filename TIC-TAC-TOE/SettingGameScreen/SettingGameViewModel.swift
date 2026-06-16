//
//  SettingGameViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import Foundation

// MARK: - Модель данных (один скин)
struct Skin: Identifiable {
    let id = UUID()          // уникальный идентификатор для ForEach
    let xImage: String       // картинка для X
    let oImage: String       // картинка для O
}

final class SettingGameViewModel: SettingGameViewModelProtocol {
    
    @Published var viewItem: SettingGameViewItem
    
    private let onNavigate: (AppRoute) -> Void
    
    init(onNavigate: @escaping (AppRoute) -> Void) {
        self.onNavigate = onNavigate
        
        let skins: [Skin] = [
            Skin(xImage: "Xskin1", oImage: "Oskin1"),
            Skin(xImage: "Xskin2", oImage: "Oskin2"),
            Skin(xImage: "Xskin3", oImage: "Oskin3"),
            Skin(xImage: "Vector-1", oImage: "Vector-2"),
            Skin(xImage: "Oskin4", oImage: "Xskin4"),
            Skin(xImage: "Oskin5", oImage: "Xskin5")
        ]
        
        self.viewItem = SettingGameViewItem(
            skins: skins,
            selectedSkinIndex: nil,
            isGameTimeEnabled: false,
            selectedDuration: .min30
        )
    }
    
    func didTapBack() {
        onNavigate(.home)
    }
    
    func didSelectSkin(index: Int) {
        viewItem = SettingGameViewItem(
            skins: viewItem.skins,
            selectedSkinIndex: index,
            isGameTimeEnabled: viewItem.isGameTimeEnabled,
            selectedDuration: viewItem.selectedDuration
        )
    }
    
    func didToggleGameTime() {
        viewItem = SettingGameViewItem(
            skins: viewItem.skins,
            selectedSkinIndex: viewItem.selectedSkinIndex,
            isGameTimeEnabled: !viewItem.isGameTimeEnabled,
            selectedDuration: viewItem.selectedDuration
        )
    }
    
    func didSelectDuration(_ option: DurationOption) {
        viewItem = SettingGameViewItem(
            skins: viewItem.skins,
            selectedSkinIndex: viewItem.selectedSkinIndex,
            isGameTimeEnabled: viewItem.isGameTimeEnabled,
            selectedDuration: option
        )
    }
}
