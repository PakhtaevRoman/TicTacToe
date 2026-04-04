//
//  ContentView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 10.02.2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            backgroundView // 🔧 Вынес фон в отдельное свойство
            
            VStack {
                topContent() // 🔧 Разделил верхний блок
                
                Spacer()
                
                middleContent() // 🔧 Разделил средний блок
                
                Spacer()
                
                bottomContent() // 🔧 Разделил нижний блок
            }
        }
    }
}

// MARK: - Background
private extension ContentView {
    var backgroundView: some View {
        Color.white
            .ignoresSafeArea()
        // 🔧 Вынес фон отдельно, чтобы не засорять body
    }
}

// MARK: - Top Content
private extension ContentView {
    func topContent() -> some View {
        HStack {
            helpButton // 🔧 Вынес кнопку в отдельный view
            
            Spacer()
            
            settingsButton // 🔧 Вынес кнопку в отдельный view
        }
        .padding(.horizontal, 21)
        .padding(.top)
    }
    
    var helpButton: some View {
        Button(action: {
            print("Help tapped")
        }) {
            Image("Vector")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
        }
        // 🔧 Упростил HStack — теперь каждая кнопка отдельно
    }
    
    var settingsButton: some View {
        Button(action: {
            print("Settings tapped")
        }) {
            Image("Setting-Icon")
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
        }
        .frame(width: 38, height: 36)
    }
}

// MARK: - Middle Content
private extension ContentView {
    func middleContent() -> some View {
        VStack {
            logoView // 🔧 Вынес логотип отдельно
            
            titleView // 🔧 Вынес текст отдельно
        }
    }
    
    var logoView: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Image("Union")
                .resizable()
                .scaledToFit()
                .frame(width: 108, height: 107)
            
            Image("Exclude")
                .resizable()
                .scaledToFit()
                .frame(width: 136, height: 135)
        }
        .padding(.leading, 24)
        .padding(.top, 26)
        // 🔧 Изолировал сложную верстку в отдельный блок
    }
    
    var titleView: some View {
        Text("TIC-TAC-TOE")
            .font(.custom("SF Pro Display", size: 32))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding(.top, 30)
        // 🔧 Теперь текст легко менять независимо от остального
    }
}

// MARK: - Bottom Content
private extension ContentView {
    func bottomContent() -> some View {
        playButton
            .padding(.horizontal, 31)
            .padding(.bottom, 40)
        // 🔧 Отделил отступы от самой кнопки
    }
    
    var playButton: some View {
        Button(action: {
            print("Let's play tapped")
        }) {
            Text("Let’s play")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color("Blue"))
        .cornerRadius(30)
        // 🔧 Сделал кнопку переиспользуемым элементом
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
