//
//  SelectGameView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.02.2026.
//

import SwiftUI

struct SelectGameView: View {
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                Spacer()
                
                middleContent()
                
                Spacer()
            }
        }
        .safeAreaInset(edge: .top) {
            topContent()
        }
    }
// MARK: - Background
// Выносим фон
// some View - возвращает какой-то конкретный тип, который реализует View, но мы его не указываем явно. Потому что View — это protocol, а не конкретный тип
// 👉 some View всегда должен возвращать ОДИН View
// ✅ Если нужно два View, надо делать обертку  VStack { ... }
    var backgroundView: some View {
        Color("BackgroundMain")
            .ignoresSafeArea()
    }
    
// MARK: - Top Content
// Верх (settings)
    func topContent() -> some View {
        HStack {
            Spacer()
            
            settingButton
        }
        .padding(.trailing, 21)
        .padding(.top, 10)
    }
    
    var settingButton: some View {
        Button {
            print("button tapped")
        } label: {
            Image("Setting-Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
        }
    }
    
// MARK: - middle Content
// Центральный блок
// 👉 Эта функция func middleContent(): собирает всё вместе и возвращает один View (VStack)
    
    func middleContent() -> some View {
        VStack(spacing: 20) {
            titleView
            singlePlayerButton
            twoplayerButton
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.15), radius: 10, x: 4, y: 4)
        .padding(.horizontal, 52)   // ← реальные отступы от экрана
        
    }
    
// Дробим внутренности
    
    var titleView: some View {
        // Заголовок
        Text("Select Game")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(Color("TitleBlack"))
            .multilineTextAlignment(.center)
    }
    
// Сейчас у тебя дублирование — это идеально для рефакторинга: 2 почти одинаковых Button
// Делаем универсальный шаблон кнопки
// func gameButton(imageName: String) - принимает параметр (imageName) и возвращает готовый UI
    func gameButton(imageName: String) -> some View {
        Button {
            print("button tapped")
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("ButtonLightBlue"))
                .frame(height: 69)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 161, maxHeight: 29)
                )
        }
    }
    
// Теперь используем:
// 👉 Они: сами ничего не рисуют напрямую и просто вызывают функцию gameButton с разными параметрами
// 👉 singlePlayerButton “для меня используй gameButton, но с картинкой Single Player”
    var singlePlayerButton: some View {
        gameButton(imageName: "Single Player")
    }
    
    var twoplayerButton: some View {
        gameButton(imageName: "Two Player")
    }
}

// Маленький апгрейд (уровень выше)
//enum GameType {
//    case single
//    case two
//
//    var imageName: String {
//        switch self {
//        case .single: return "Single Player"
//        case .two: return "Two Player"
//        }
//    }
//}
struct SelectGameView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGameView()
    }
}
