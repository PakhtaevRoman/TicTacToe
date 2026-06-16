//
//  PlayerOneWinViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 15.06.2026.
//

import Foundation

final class PlayerWinViewModel: PlayerWinViewModelProtocol {

// MARK: - State
    @Published var viewItem: PlayerWinViewItem
    
    private let onNavigate: (AppRoute) -> Void
    
// MARK: - init
    init(onNavigate: @escaping (AppRoute) -> Void) {
        
    self.onNavigate = onNavigate
    
    self.viewItem = PlayerWinViewItem(
        title: "Player One win!",
        avatarImageName: "OBJECTS",
        primaryButtonTitle: "Play again",
        secondaryButtonTitle: "Back",
        backgroundColorName: "BackgroundMain",
        primaryButtonColorName: "Blue",
        secondaryButtonColorName: "White"
    )
}
    
// MARK: - Actions
    func didTapPlayAgain() {
        print("Play again tapped")
    }
    
    func didTapBack() {
        print("Back tapped")
        onNavigate(.home)
    }
}
