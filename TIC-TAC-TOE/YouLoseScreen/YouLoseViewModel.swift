//
//  YouLoseViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

// YouLoseViewModel(Логика): Это мозг экрана: хранит данные и реагирует на нажатия.
// Важно:
// ViewModel НЕ содержит SwiftUI
// только логика и навигация

import Foundation

final class YouLoseViewModel: YouLoseViewModelProtocol {
    
    // MARK: - State
    @Published var viewItem: YouLoseViewItem
    
    private let onNavigate: (AppRoute) -> Void
    
    // MARK: - Init
    init(onNavigate: @escaping (AppRoute) -> Void) {
        
        self.onNavigate = onNavigate
        
        self.viewItem = YouLoseViewItem(
            title: "You Lose!",
            avatarImageName: "IsolationMode",
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
        // пример навигации:
        // onNavigate(.selectGame)
    }
    
    func didTapBack() {
        print("Back tapped")
        onNavigate(.home)
    }
}
