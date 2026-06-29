//
//  PlayerWinViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 15.06.2026.
//

import Foundation
import Combine

protocol PlayerWinViewModelProtocol: ObservableObject {
    var viewItem: PlayerWinViewItem { get }
    
    func didTapPlayAgain()
    func didTapBack()
    
}
