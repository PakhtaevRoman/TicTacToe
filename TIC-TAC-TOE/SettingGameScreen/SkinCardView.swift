//
//  SkinCardView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import SwiftUI

struct SkinCardView: View {

    let skin: Skin
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        VStack(spacing: 20) {

            HStack(spacing: 5) {
                Image(skin.xImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 54)

                Image(skin.oImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 54)
            }

            Text(isSelected ? "Picked" : "Choose")
                .frame(width: 112, height: 39)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(isSelected ? .white : Color("TitleBlack"))
                .background(isSelected ? Color("Blue") : Color("ButtonLightBlue"))
                .cornerRadius(30)
        }
        .frame(width: 152, height: 150)
        .background(Color.white)
        .cornerRadius(30)
        .onTapGesture {
            action()
        }
    }
}
