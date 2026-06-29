//
//  PlayingFieldTwoViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

import Foundation
import Combine

final class PlayingFieldViewModel: ObservableObject {
    
    @Published var board: [[CellState]]
    @Published var timeText: String = "00:00"
    
    // Состояние окончания игры
    @Published var isGameOver = false
    @Published var winner: CellState? = nil
    
    private var timer: Timer?
    private var seconds: Int = 0
    
    let viewItem: PlayingFieldViewItem
    
    private let router: AppRouter
    private let skin: Skin
    
    var skinX: String { skin.xImage }
    var skinO: String { skin.oImage }
    
    private var isXTurn = true
    
    init(router: AppRouter) {
        self.router = router
        
        self.board = Array(
            repeating: Array(repeating: .empty, count: 3),
            count: 3
        )
        
        self.skin = SkinProvider.shared.currentSkin()
        
        self.viewItem = PlayingFieldViewItem(
            backButtonImage: "Icon",
            playerOneImage: skin.xImage,
            playerOneName: "You",
            playerTwoImage: skin.oImage,
            playerTwoName: "Player Two",
            turnTitle: "Your turn",
            backgroundColorName: "BackgroundMain",
            cellBackgroundColorName: "ButtonLightBlue"
        )
    }
    
    func didTapBack() {
        router.push(.selectGame)
    }
    
    // MARK: - Game Logic
    
    func didTapCell(row: Int, col: Int) {

        guard board[row][col] == .empty else { return }
        guard !isGameOver else { return }

        let currentPlayer: CellState = isXTurn ? .x : .o
        board[row][col] = currentPlayer

        isXTurn.toggle()

        // 1. Сначала победа
        if checkWinner(for: currentPlayer) {
            endGame(winner: currentPlayer)
            return
        }

        // 2. Потом ничья
        if isBoardFull() {
            endGame(draw: true)
            return
        }
    }
    
    // MARK: - Timer
    
    func startTimer() {
        guard timer == nil else { return }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            self.seconds += 1
            let minutes = self.seconds / 60
            let secs = self.seconds % 60
            self.timeText = String(format: "%02d:%02d", minutes, secs)
        }
    }
    
    // MARK: - Winner Check
    
    private func checkWinner(for player: CellState) -> Bool {
        
        // горизонтали
        for row in 0..<3 {
            if board[row][0] == player &&
               board[row][1] == player &&
               board[row][2] == player {
                return true
            }
        }
        
        // вертикали
        for col in 0..<3 {
            if board[0][col] == player &&
               board[1][col] == player &&
               board[2][col] == player {
                return true
            }
        }
        
        // диагонали
        if board[0][0] == player &&
           board[1][1] == player &&
           board[2][2] == player {
            return true
        }
        
        if board[0][2] == player &&
           board[1][1] == player &&
           board[2][0] == player {
            return true
        }
        
        return false
    }
    
    // MARK: - Draw Check
    
    private func isBoardFull() -> Bool {
        for row in board {
            if row.contains(.empty) {
                return false
            }
        }
        return true
    }
    // функцию завершения игры
    private func finishGame(with result: GameResult) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {

            switch result {

            case .xWin:
                self.router.push(.playerWin)

            case .oWin:
                self.router.push(.youLose)

            case .draw:
                self.router.push(.draw)
            }
        }
    }
    
    // ВЫНЕСИ ОБЩЕЕ ОКОНЧАНИЕ
    private func endGame(winner: CellState? = nil, draw: Bool = false) {

        isGameOver = true
        timer?.invalidate()
        timer = nil

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {

            if draw {
                self.router.push(.draw)
                return
            }

            if winner == .x {
                self.router.push(.playerWin)
            } else {
                self.router.push(.youLose)
            }
        }
    }
}
