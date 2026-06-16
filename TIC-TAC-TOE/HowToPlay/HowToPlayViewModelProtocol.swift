//
//  HowToPlayViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 16.06.2026.
//

import Foundation
import Combine

protocol HowToPlayViewModelProtocol: ObservableObject {
    
    var viewItem: HowToPlayViewItem { get }
    
    func didTapBack()
}
