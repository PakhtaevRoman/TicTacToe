//
//  PlayerOneWinScreen.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 15.06.2026.
//

import SwiftUI

struct PlayerWinScreen<ViewModel: PlayerWinViewModelProtocol>: View {
  
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            
            backgroundView
            
            VStack {
                
                Spacer()
                
                titleView
                
                avatarView
                
                Spacer()
                
                primaryButton
                
                secondaryView
            }
        }
    }
}

// MARK: - Background
private extension PlayerWinScreen {
    
    var backgroundView: some View {
        Color(viewModel.viewItem.backgroundColorName)
            .ignoresSafeArea()
    }
}

// MARK: - Content
private extension PlayerWinScreen {
    
    var titleView: some View {
        Text(viewModel.viewItem.title)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.black)
    }
    
    var avatarView: some View {
        HStack {
            Image(viewModel.viewItem.avatarImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 182, height: 136)
        }
        .frame(width: 228, height: 136)
        .background(
            Circle().fill(Color("Blue"))
        )
    }
}



// MARK: - Button
private extension PlayerWinScreen {
    
    var primaryButton: some View {
        Button {
            viewModel.didTapPlayAgain()
        } label: {
            Text(viewModel.viewItem.primaryButtonTitle)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color(viewModel.viewItem.primaryButtonColorName))
        .cornerRadius(30)
        .padding(.horizontal, 21)
    }
    
    var secondaryView: some View {
        Button {
            viewModel.didTapBack()
        } label: {
            Text(viewModel.viewItem.secondaryButtonTitle)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(Color(viewModel.viewItem.primaryButtonColorName))
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color.white)
        .cornerRadius(30)
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color(viewModel.viewItem.primaryButtonColorName), lineWidth: 2)
        )
        .padding(.horizontal, 21)
        .padding(.bottom, 18)
    }
}
