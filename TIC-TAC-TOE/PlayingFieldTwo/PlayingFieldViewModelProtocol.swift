//
//  PlayingFieldTwoViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

import Foundation
import Combine

protocol PlayingFieldViewModelProtocol: ObservableObject {

    var viewItem: PlayingFieldViewItem { get }

    var board: [[String]] { get }
    var timeText: String { get }

    var skinX: String { get }
    var skinO: String { get }

    func didTapBack()

    func didTapCell(row: Int, col: Int)
    
    func startTimer()
}
