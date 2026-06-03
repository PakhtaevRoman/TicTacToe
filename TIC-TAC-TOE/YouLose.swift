//
//  YouLose.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 20.05.2026.
//

import SwiftUI

struct YouLose: View {
    var body: some View {
        ZStack {
            
            background
            
            VStack {
                Spacer()
                
                title
                
                avatar
                
                Spacer()
                
                primaryButton
                
                secondaryButton
            }
        }
    }
}
// MARK: - SubView // ✅ Разделение кода для удобства навигации в Xcode
private extension YouLose {
    //1
    var background: some View {
        Color("BackgroundMain")
            .ignoresSafeArea()
    }
    //2
    var title: some View {
            Text("You Lose!")
                .font(.system(size: 20, weight: .bold))
    }
    var avatar: some View {
        HStack {
            Image("IsolationMode")
                .resizable()
                .scaledToFit()
                .frame(width: 182, height: 136)
            
        }
        .frame(width: 228, height: 228)
        .background(
            Circle().fill(Color("Blue"))
            )
    }
    //3
    var primaryButton: some View {
        Button {
            print("Player again tapped")
        } label: {
            Text("Play again")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color("Blue"))
        .cornerRadius(30)
        .padding(.horizontal, 21)
    }
    
    var secondaryButton: some View {
        Button {
            print("Back tapped")
        } label: {
            Text("Back")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color("Blue"))
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color.white)
        .cornerRadius(30)
        .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color("Blue"), lineWidth: 2)
        )
        .padding(.horizontal, 21)
        .padding(.bottom, 18)
    }
}
struct YouLose_Previews: PreviewProvider {
    static var previews: some View {
        YouLose()
    }
}
