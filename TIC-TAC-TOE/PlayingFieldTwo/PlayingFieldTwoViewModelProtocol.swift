//
//  PlayingFieldTwoViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

import Foundation
import Combine

protocol PlayingFieldTwoViewModelProtocol: ObservableObject {

    var viewItem: PlayingFieldTwoViewItem { get }

    var board: [[String]] { get }

    func didTapBack()

    func didTapCell(row: Int, col: Int)

    func didTapPlayerOne()

    func didTapPlayerTwo()
}
