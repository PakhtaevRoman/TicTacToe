//
//  Draw.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 20.05.2026.
//

import SwiftUI

struct Draw: View {
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
// MARK: - Subviews // ✅ Разделение кода для удобства навигации в Xcode
//1
private extension Draw {
    var background: some View {
        Color("BackgroundMain")
            .ignoresSafeArea()
    }
    //2
    var title: some View {
        Text("Draw!")
            .font(.system(size: 20, weight: .bold))
    }
    var avatar: some View {
        HStack {
            Image("Layer")
                .resizable()
                .scaledToFit()
                .frame(width: 165, height: 128)
        }
        .frame(width: 228, height: 228)
        .background(
            Circle().fill(Color("Blue"))
        )
    }
    
    //3
    var primaryButton: some View {
        Button {
            print("Play again tapped")
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
                .font(.system(size: 20) .weight(.semibold))
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

struct Draw_Previews: PreviewProvider {
    static var previews: some View {
        Draw()
    }
}
