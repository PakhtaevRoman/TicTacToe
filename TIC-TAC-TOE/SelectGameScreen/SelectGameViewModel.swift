//
//  SelectGameViewModel.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import Foundation

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
        print("Settings tapped")
    }
    
    func didTapSinglePlayer() {
        print("Single Player")
    }
    
    func didTapTwoPlayer() {
        print("Two Player")
    }
}
