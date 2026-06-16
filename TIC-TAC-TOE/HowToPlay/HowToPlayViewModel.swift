//
//  HowToPlayViewModel.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 16.06.2026.
//

import Foundation

final class HowToPlayViewModel: HowToPlayViewModelProtocol {
  
// MARK: - State
    @Published var viewItem: HowToPlayViewItem
    
    private let onNavigate: (AppRoute) -> Void
    
// MARK: - Init
    init(onNavigate: @escaping (AppRoute) -> Void) {

            self.onNavigate = onNavigate

            self.viewItem = HowToPlayViewItem(

                title: "How to play",

                backIconName: "Icon",

                backgroundColorName: "BackgroundMain",
                numberBackgroundColorName: "Purple",
                textBackgroundColorName: "Light-blue",

                rules: [

                    .init(
                        number: "1",
                        text: "Draw a grid with three rows and three columns, creating nine squares in total."
                    ),

                    .init(
                        number: "2",
                        text: "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker."
                    ),

                    .init(
                        number: "3",
                        text: "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends."
                    ),

                    .init(
                        number: "4",
                        text: """
                        The first player to align three of their markers horizontally, vertically, or diagonally wins.

                        Examples of Winning Combinations:

                        Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9

                        Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9

                        Diagonal: Squares 1, 5, 9 or 3, 5, 7
                        """
                    )
                ]
            )
        }

        // MARK: - Actions

        func didTapBack() {
            onNavigate(.home)
        }
    }
