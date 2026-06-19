//
//  PlayingFieldTwoViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

import Foundation

final class PlayingFieldTwoViewModel: PlayingFieldTwoViewModelProtocol {

    // MARK: - State

    @Published var board: [[String]]

    let viewItem: PlayingFieldTwoViewItem

    private let onNavigate: (AppRoute) -> Void

    // MARK: - Init

    init(onNavigate: @escaping (AppRoute) -> Void) {

        self.onNavigate = onNavigate

        self.board = Array(
            repeating: Array(repeating: "", count: 3),
            count: 3
        )

        self.viewItem = PlayingFieldTwoViewItem(
            backButtonImage: "Icon",

            playerOneImage: "Union",
            playerOneName: "You",

            playerTwoImage: "Oskin1",
            playerTwoName: "Player Two",

            timerText: "1:59",

            turnImage: "Oskin1",
            turnTitle: "Player Two turn",

            backgroundColorName: "BackgroundMain",
            cellColorName: "ButtonLightBlue"
        )
    }

    // MARK: - Actions

    func didTapBack() {
        onNavigate(.home)
    }

    func didTapPlayerOne() {
        print("Player One tapped")
    }

    func didTapPlayerTwo() {
        print("Player Two tapped")
    }

    func didTapCell(row: Int, col: Int) {

        guard board[row][col].isEmpty else { return }

        board[row][col] = "O"
    }
}
