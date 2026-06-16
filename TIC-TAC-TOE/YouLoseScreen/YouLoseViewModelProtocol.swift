//
//  YouLoseViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

// YouLoseViewModelProtocol(контракт)
// Это “правила”, что умеет ViewModel.
// Зачем это нужно:
// View работает не с классом, а с протоколом
// проще тестировать
// проще менять реализацию

import Foundation
import Combine

protocol YouLoseViewModelProtocol: ObservableObject {
    
    var viewItem: YouLoseViewItem { get }
    
    func didTapPlayAgain()
    func didTapBack()
}
