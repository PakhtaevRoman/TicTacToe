//
//  SwiftUIView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 22.04.2026.
//

import SwiftUI

struct PlayingFieldTwo: View {
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                topBar
                
                gameInfoBlock
                
                turnInfo
                
                gameGrid
                
                Spacer()
            }
        }
    }
}

// MARK: - Background
var backgroundView: some View {
    Color("BackgroundMain")
        .ignoresSafeArea()
}

// MARK: - Top Bar (верхняя панель)
var topBar: some View {
    HStack {
        exitButton
        
        Spacer()
    }
    .padding(.horizontal, 26.62)
    .padding(.top, 73)
}

var exitButton: some View {
    Button {
        print("Exit")
    } label: {
        Image("Icon")
            .resizable()
            .scaledToFit()
            .frame(width: 30, height: 22)
    }
}

// MARK: - Game Info (игроки + таймер)
var gameInfoBlock: some View {
    HStack {
        playerCard(
            image: "Union",
            title: "You"
        )
        
        Spacer()
        
        timerView
        
        Spacer()
        
        playerCard(
            image: "Oskin1",
            title: "Player Two"
        )
    }
    .padding(.horizontal, 30)
    .padding(.top)
}

// Универсальная карточка игрока (реиспользование)
func playerCard(image: String, title: String) -> some View {
    VStack {
        Button {
            print("player tapped")
        } label: {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(height: 53)
        }
        
        Text(title)
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color("TitleBlack"))
    }
    .frame(width: 103, height: 103)
    .background(Color("ButtonLightBlue"))
    .cornerRadius(30)
}

// Таймер
var timerView: some View {
    Text("1:59")
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(Color("TitleBlack"))
}

// MARK: - Turn Info (чей ход)
var turnInfo: some View {
    HStack {
        Image("Oskin1")
            .resizable()
            .scaledToFit()
            .frame(height: 53)
        
        Text("Player Two turn")
            .font(.system(size: 20).weight(.bold))
    }
    .padding(.top, 45)
}

// MARK: - Game Grid (игровое поле)
var gameGrid: some View {
    HStack(spacing: 20) {
        column
        column
        column
    }
    .frame(width: 302, height: 299)
    .background(Color.white)
    .cornerRadius(30)
    .padding(.top, 44)
}

// Одна колонка
var column: some View {
    VStack(spacing: 20) {
        cellButton
        cellButton
        cellButton
    }
}

// Одна ячейка (самое важное переиспользование)
var cellButton: some View {
    Button {
        print("cell tapped")
    } label: {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("ButtonLightBlue"))
            .frame(width: 74, height: 73)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingFieldOne()
    }
}
