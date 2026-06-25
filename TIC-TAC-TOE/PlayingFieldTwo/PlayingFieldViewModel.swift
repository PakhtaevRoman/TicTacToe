//
//  PlayingFieldTwoViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

import Foundation
import Combine

final class PlayingFieldViewModel: ObservableObject {

    @Published var board: [[String]]
    
    @Published var timeText: String = "00:00"

    private var timer: Timer?
    private var seconds: Int = 0

    let viewItem: PlayingFieldViewItem

    private let onNavigate: (AppRoute) -> Void

    private let skin: Skin
    
    var skinX: String { skin.xImage }
    var skinO: String { skin.oImage }

    private var isXTurn = true

    init(onNavigate: @escaping (AppRoute) -> Void) {

        self.onNavigate = onNavigate

        self.board = Array(
            repeating: Array(repeating: "", count: 3),
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
        onNavigate(.selectGame)
    }

    func didTapCell(row: Int, col: Int) {

        guard board[row][col].isEmpty else { return }

        board[row][col] = isXTurn ? skin.xImage : skin.oImage
        isXTurn.toggle()
    }
    
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
}
