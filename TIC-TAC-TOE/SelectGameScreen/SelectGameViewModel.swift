//
//  SelectGameViewModel.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//
import Foundation
import Combine

final class SelectGameViewModel: SelectGameViewModelProtocol {

    @Published var viewItem: SelectGameViewItem

    private let onNavigate: (AppRoute) -> Void

    init(onNavigate: @escaping (AppRoute) -> Void) {

        self.onNavigate = onNavigate

        self.viewItem = SelectGameViewItem(
            title: "Select Game",
            singlePlayerImage: "Single Player",
            twoPlayerImage: "Two Player",
            backgroundColorName: "BackgroundMain",
            cardColorName: "ButtonLightBlue",
            textColorName: "TitleBlack",
            settingsIconName: "Setting-Icon"
        )
    }

    func didTapSettings() {
        onNavigate(.settingsFromSelectGame)
    }

    func didTapSinglePlayer() {

        GameModeStorage.shared.selectedMode = .single
        onNavigate(.playingField)
    }

    func didTapTwoPlayer() {

        GameModeStorage.shared.selectedMode = .twoPlayer
        onNavigate(.playingField)
    }
}
