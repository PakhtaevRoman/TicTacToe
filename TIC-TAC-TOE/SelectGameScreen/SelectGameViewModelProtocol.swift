//
//  SelectGameViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import Foundation

protocol SelectGameViewModelProtocol: ObservableObject {
    
    var viewItem: SelectGameViewItem { get }
    
    func didTapSettings()
    func didTapSinglePlayer()
    func didTapTwoPlayer()
}
