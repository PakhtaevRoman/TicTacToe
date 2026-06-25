//
//  PlayingFieldOneViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//
// Протокол описывает:
// Что экран может получить от ViewModel?
// Экрану не важно какая именно ViewModel используется.
// board - поле
// row - ряд
// col - столбец


//import Foundation
//import Combine
//
//protocol PlayingFieldOneViewModelProtocol: ObservableObject {
//    
//// Данные для интерфейса
//    var viewItem:  PlayingFieldOneViewItem { get }
//    
//// Игровое поле 3x3
//    var board: [[String]] { get }
//    
//// Нажатие назад
//    func didTapBack()
//    
//// Нажатие на клетку
//    func didTapCell(row: Int, col: Int)
//}
