//
//  PlayingFieldOne.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 03.04.2026.
//

//Коротко, что изменилось
//✅ Убрал 9 кнопок → сделал через ForEach
//✅ Вынес повторяющиеся UI в PlayerView и CellView
//✅ Добавил @State board (основа логики игры)
//✅ Отделил логику (tapCell)
//✅ Разметил код через MARK

import SwiftUI

struct PlayingFieldOne: View {
    
    // MARK: - Состояние игры
    // Добавил массив 3x3 для хранения X / O
    @State private var board: [[String]] = Array(
        repeating: Array(repeating: "", count: 3),
        count: 3
    )
    
    var body: some View {
        ZStack {
            
            // MARK: - Фон
            Color("BackgroundMain")
                .ignoresSafeArea()
            
            VStack {
                
                // MARK: - Верхняя панель
                HStack {
                    Button {
                        print("button tapped")
                    } label: {
                        Image("Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 22)
                            .padding(.top, 30)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 21)
                .padding(.top, 20)
                
                
                // MARK: - Блок игроков
                HStack {
                    
                    PlayerView(image: "Xskin1", name: "You")
                    
                    Spacer()
                    
                    PlayerView(image: "Oskin1", name: "Player Two")
                }
                .padding(.horizontal, 30)
                .padding(.top)
                
                
                // MARK: - Текст хода
                Text("Your turn")
                    .font(.system(size: 20))
                    .padding(.top, 45)
                
                
                // MARK: - Игровое поле
                VStack {
                    
                    // Вместо 9 кнопок → цикл
                    ForEach(0..<3, id: \.self) { row in
                        HStack(spacing: 20) {
                            
                            ForEach(0..<3, id: \.self) { col in
                                
                                CellView(
                                    value: board[row][col],
                                    action: {
                                        tapCell(row: row, col: col)
                                    }
                                )
                            }
                        }
                    }
                }
                .frame(width: 302, height: 299)
                .background(Color.white)
                .cornerRadius(30)
                .padding(.top, 44)
                .padding(.bottom, 217)
            }
        }
    }
    
    
    // MARK: - Логика
    func tapCell(row: Int, col: Int) {
        print("Tapped cell: \(row), \(col)")
        
        if board[row][col].isEmpty {
            board[row][col] = "X"
        }
    }
}


// MARK: - Компонент игрока
struct PlayerView: View {
    
    let image: String
    let name: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 53)
            
            Text(name)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color("TitleBlack"))
        }
        .frame(width: 103, height: 103)
        .background(Color("ButtonLightBlue"))
        .cornerRadius(30)
    }
}


// MARK: - Компонент клетки
struct CellView: View {
    
    let value: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("ButtonLightBlue"))
                    .frame(width: 74, height: 73)
                
                Text(value)
                    .font(.largeTitle)
            }
        }
    }
}

struct PlayingFieldOne_Previews: PreviewProvider {
    static var previews: some View {
        PlayingFieldOne()
    }
}
