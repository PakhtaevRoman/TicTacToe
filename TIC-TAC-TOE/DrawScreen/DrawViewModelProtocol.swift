//
//  DrawViewModelProtocol.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 13.06.2026.
//
// Protocol - инструкция, какие действия будут выполняться, нажатие кнопки, описываем связь между View и ViewModel
// DrawViewModelProtocol: ObservableObject - любая ВьюМодель для Вью должна иметь данные Модели и обрабатывать нажатие на кнопки
// var viewItem: DrawViewItem { get } - содержит все что нужно показать на экране
// again - еще раз
// did - произошло
// tap - нажатие

import Foundation
import Combine

protocol DrawViewModelProtocol: ObservableObject {
    
    var viewItem: DrawViewItem { get }
    
    func didTapPlayAgain()
    func didTapBack()
    
}
