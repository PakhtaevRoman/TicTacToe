//
//  SelectGameView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.02.2026.
//

import SwiftUI

struct SelectGameScreen<ViewModel: SelectGameViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                Spacer()
                
                middleContent
                
                Spacer()
            }
        }
        .safeAreaInset(edge: .top) {
            topContent
        }
    }
}

// MARK: - Background
private extension SelectGameScreen {
    
    var backgroundView: some View {
        Color(viewModel.viewItem.backgroundColorName)
            .ignoresSafeArea()
    }
}

// MARK: - Top Content
private extension SelectGameScreen {
    
    var topContent: some View {
        HStack {
            Spacer()
            
            settingButton
        }
        .padding(.trailing, 21)
        .padding(.top, 10)
    }
    
    var settingButton: some View {
        Button {
            viewModel.didTapSettings()
        } label: {
            Image(viewModel.viewItem.settingsIconName)
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
        }
    }
}

// MARK: - Middle Content
private extension SelectGameScreen {
    
    var middleContent: some View {
        VStack(spacing: 20) {
            
            titleView
            
            singlePlayerButton
            
            twoPlayerButton
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.15), radius: 10, x: 4, y: 4)
        .padding(.horizontal, 52)
    }
    
    var titleView: some View {
        Text(viewModel.viewItem.title)
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(Color(viewModel.viewItem.textColorName))
            .multilineTextAlignment(.center)
    }
    
    var singlePlayerButton: some View {
        gameButton(imageName: viewModel.viewItem.singlePlayerImage) {
            viewModel.didTapSinglePlayer()
        }
    }
    
    var twoPlayerButton: some View {
        gameButton(imageName: viewModel.viewItem.twoPlayerImage) {
            viewModel.didTapTwoPlayer()
        }
    }
    
    func gameButton(imageName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color(viewModel.viewItem.cardColorName))
                .frame(height: 69)
                .overlay(
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 161, maxHeight: 29)
                )
        }
    }
}

// MARK: - Preview
struct SelectGameScreen_Previews: PreviewProvider {
    static var previews: some View {
        SelectGameScreen(
            viewModel: SelectGameViewModel(onNavigate: { _ in })
        )
    }
}
