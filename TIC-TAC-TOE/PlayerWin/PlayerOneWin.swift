//
//  PlayerOneWin.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 23.04.2026.
//

import SwiftUI

struct PlayerOneWin: View {
    var body: some View {
        ZStack {
            background // ✅ Вынесен фон в отдельную view для читаемости
            
            VStack {
                Spacer()
                
                title // ✅ Убрали лишний HStack, вынесли Text в отдельную view
                
                avatar // ✅ Вынесена логика аватара
                
                Spacer()
                
                primaryButton // ✅ Вынесена кнопка "Play again"
                secondaryButton // ✅ Вынесена кнопка "Back"
            }
        }
    }
}

// MARK: - Subviews // ✅ Разделение кода для удобства навигации в Xcode
private extension PlayerOneWin {
    
    var background: some View {
        Color("BackgroundMain")
            .ignoresSafeArea() // ✅ Без изменений, но вынесено отдельно
    }
    
    var title: some View {
        Text("Player One win!")
            .font(.system(size: 20, weight: .bold)) // ✅ Исправлен синтаксис font (было .weight отдельно)
    }
    
    var avatar: some View {
        Image("OBJECTS")
            .resizable()
            .scaledToFit()
            .frame(width: 134, height: 148) // ✅ Размер картинки
            .frame(width: 228, height: 228) // ✅ Размер контейнера
            .background(
                Circle().fill(Color("Blue")) // ✅ Круг уже делает форму идеальной
            )
            // ❌ Удалён .cornerRadius(114) — он был лишним, т.к. уже используется Circle()
    }
    
    var primaryButton: some View {
        Button(action: {
            print("Play again tapped") // ✅ Более осмысленный текст в логе
        }) {
            Text("Play again")
                .font(.system(size: 20, weight: .semibold)) // ✅ Исправлен font
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color("Blue"))
        .cornerRadius(30)
        .padding(.horizontal, 21)
    }
    
    var secondaryButton: some View {
        Button(action: {
            print("Back tapped") // ✅ Более осмысленный текст в логе
        }) {
            Text("Back")
                .font(.system(size: 20, weight: .semibold)) // ✅ Исправлен font
                .foregroundColor(Color("Blue"))
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color.white)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color("Blue"), lineWidth: 2) // ✅ Обводка оставлена как есть
        )
        .padding(.horizontal, 21)
        .padding(.bottom, 18)
    }
}

struct PlayerOneWin_Previews: PreviewProvider {
    static var previews: some View {
        PlayerOneWin()
    }
}
