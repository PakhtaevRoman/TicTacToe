//
//  PlayingFieldOneViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//
// Здесь находится вся логика экрана.
// ViewModel отвечает на вопрос:
// Что должно произойти после действия пользователя?

// Что делает @Published, Когда массив изменится: board[0][0] = "X", SwiftUI автоматически обновит экран. Без @Published клетка не перерисуется.
// let viewItem: PlayingFieldOneViewItem - Хранит все данные для интерфейса.
// Router -> private let onNavigate: (AppRoute) -> Void - Используется для переходов между экранами.
// Actions - Действия

import Foundation
import Combine

final class PlayingFieldOneViewModel: PlayingFieldOneViewModelProtocol {

    // MARK: - State

    @Published var board: [[String]]

    let viewItem: PlayingFieldOneViewItem

    private let onNavigate: (AppRoute) -> Void

    // MARK: - Init

    init(onNavigate: @escaping (AppRoute) -> Void) {

        self.onNavigate = onNavigate

        self.board = Array(
            repeating: Array(repeating: "", count: 3),
            count: 3
        )

        self.viewItem = PlayingFieldOneViewItem(
            backButtonImage: "Icon",
            playerOneImage: "Xskin1",
            playerOneName: "You",
            playerTwoImage: "Oskin1",
            playerTwoName: "Player Two",
            turnTitle: "Your turn",
            backgroundColorName: "BackgroundMain",
            cellBackgroundColorName: "ButtonLightBlue"
        )
    }

    // MARK: - Actions

    func didTapBack() {
        onNavigate(.home)
    }

    func didTapCell(row: Int, col: Int) {

        guard board[row][col].isEmpty else {
            return
        }

        board[row][col] = "X"
    }
}

