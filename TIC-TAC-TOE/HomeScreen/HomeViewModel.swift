//
//  HomeViewModel.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: - State
    @Published var viewItem: HomeViewItem
    
    private let onNavigate: (AppRoute) -> Void
    
    // MARK: - Init
    init(onNavigate: @escaping (AppRoute) -> Void) {
        self.onNavigate = onNavigate
                
        
        self.viewItem = HomeViewItem(
            helpIconName: "Vector",
            settingsIconName: "Setting-Icon",
            
            title: "TIC-TAC-TOE",
            
            playButtonTitle: "Let’s play",
            
            logoLeftName: "Union",
            logoRightName: "Exclude",
            
            backgroundColorName: "BackgroundMain",
            buttonColorName: "Blue"
        )
    }
    
    // MARK: - Actions
    func didTapHelp() {
        onNavigate(.howToPlay)
    }
    
    func didTapSettings() {
        print("Settings tapped")
    }
    
    func didTapPlay() {
        onNavigate(.playingFieldTwo)
    }
}

