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
    
    // MARK: - Init
    init() {
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
        print("Help tapped")
    }
    
    func didTapSettings() {
        print("Settings tapped")
    }
    
    func didTapPlay() {
        print("Play tapped")
    }
}
