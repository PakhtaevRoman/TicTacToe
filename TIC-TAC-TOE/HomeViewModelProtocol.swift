//
//  HomeViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import Foundation
import Combine

protocol HomeViewModelProtocol: ObservableObject {
    var viewItem: HomeViewItem { get }
    
    func didTapHelp()
    func didTapSettings()
    func didTapPlay()
}
