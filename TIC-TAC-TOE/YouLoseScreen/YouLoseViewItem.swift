//
//  YouLoseViewItem.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

// YouLoseViewItem(данные экрана)
// Это просто структура с данными для UI (тексты, цвета, картинки).
// View НЕ знает строк "You Lose!" или "Play again" — всё приходит отсюда.

import Foundation

struct YouLoseViewItem {
    
    let title: String
    
    let avatarImageName: String
    
    let primaryButtonTitle: String
    let secondaryButtonTitle: String
    
    let backgroundColorName: String
    let primaryButtonColorName: String
    let secondaryButtonColorName: String
}
