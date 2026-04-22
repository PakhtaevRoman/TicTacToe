//
//  HowToPlay.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 22.04.2026.
//

import SwiftUI

struct HowToPlay: View {
    
    var body: some View {
        ZStack {
            Color("BackgroundMain")
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    HStack {
                        Button {
                            print("back tapped")
                        } label: {
                            Image("Icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 22)
                        }
                        
                        Spacer()
                        
                        Text("How to play")
                            .font(.system(size: 24).weight(.bold))
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 21)
                    
                    VStack(spacing: 16) {
                        ruleItem("1", "Draw a grid with three rows and three columns, creating nine squares in total.")
                        ruleItem("2", "Players take turns placing their marker (X or O) in an empty square. \nTo make a move, a player selects a number corresponding to the square where they want to place their marker.")
                        ruleItem("3", "Player X starts by choosing a square (e.g., square 5). \nPlayer O follows by choosing an empty square (e.g., square 1). \nContinue alternating turns until the game ends.")
                        ruleItem("4", "The first player to align three of their markers horizontally, vertically, or diagonally wins. \nExamples of Winning \nCombinations: \nHorizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 \nVertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 \nDiagonal: Squares 1, 5, 9 or 3, 5, 7")
                    }
                    .padding(.horizontal, 21)
                    .padding(.top)
                }
            }
        }
    }
    
    // MARK: - Rule Item
    func ruleItem(_ number: String, _ text: String) -> some View {
        HStack(spacing: 20) {
            Text(number)
                .frame(width: 45, height: 45)
                .background(Color("Purple"))
                .cornerRadius(22.5)
            
            Text(text)
                .padding()
                .frame(width: 283)
                .background(Color("Light-blue"))
                .cornerRadius(30)
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}
