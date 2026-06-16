//
//  DrawViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 13.06.2026.
//
// final class DrawViewModel: DrawViewModelProtocol - логика экрана, отвечает за поведение
// @Published - наблюдает за состоянием экрана, когда данные изменяются viewItem.title = "New title” ➡️ SwiftUI автоматически перерисует экран.
// private let onNavigate: (AppRoute) -> Void ➡️ Это функция перехода между экранами. ➡️ onNavigate(.draw) - переводит пользователя на экран выбора игры.
// init(onNavigate: @escaping (AppRoute) -> Void) - Здесь создаются начальные данные для отображения.
// функции обработок кнопок
// Actions - Действия
// Main - Основной


import Foundation

final class DrawViewModel: DrawViewModelProtocol {
    
// MARK: - State
    @Published var viewItem: DrawViewItem
    
    private let onNavigate: (AppRoute) -> Void
    
// MARK: - Init
    init(onNavigate: @escaping (AppRoute) -> Void) {
        
        self.onNavigate = onNavigate
        
        self.viewItem = DrawViewItem(
            title: "Draw!",
            avatarImageName: "Layer",
            primaryButtonTitle: "Play again",
            secondaryButtonTitle: "Back",
            backgroundColorName: "BackgrounMain",
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
