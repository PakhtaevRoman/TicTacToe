//
//  SettingGameViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import Foundation
import Combine

protocol SettingGameViewModelProtocol: ObservableObject {
    var viewItem: SettingGameViewItem { get }
    
    func didTapBack()
    func didSelectSkin(index: Int)
    
    func didToggleGameTime()
    func didSelectDuration(_ option: DurationOption)
}
