//
//  PlayingFieldOneViewItem.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//
// ViewItem хранит данные для отображения экрана.
// Он отвечает на вопрос:
// Что нужно показать на экране?
// Например:
// название игроков
// картинки игроков
// текст "Your turn"
// название цветов
// название иконок
// Вся информация для UI лежит в одном месте.

// turn title - перевернуть заголовок
// cell - клетка

import Foundation

struct PlayingFieldOneViewItem {

    // Картинка кнопки назад
    let backButtonImage: String
    
// Игрок №1
    let playerOneImage: String
    let playerOneName: String
    
// Игрок №2
    let playerTwoImage: String
    let playerTwoName: String
    
// Текст под игроками
    let turnTitle: String
    
// Цвета
    let backgroundColorName: String
    let cellBackgroundColorName: String
    
}
