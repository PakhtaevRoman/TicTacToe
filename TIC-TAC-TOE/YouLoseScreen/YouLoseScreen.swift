//
//  YouLoseScreen.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import SwiftUI

struct YouLoseScreen<ViewModel: YouLoseViewModelProtocol>: View {
    
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
                
                secondaryButton
            }
        }
    }
}

// MARK: - Background
private extension YouLoseScreen {
    
    var backgroundView: some View {
        Color(viewModel.viewItem.backgroundColorName)
            .ignoresSafeArea()
    }
}

// MARK: - Content
private extension YouLoseScreen {
    
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
        .frame(width: 228, height: 228)
        .background(
            Circle().fill(Color("Blue"))
        )
    }
}

// MARK: - Buttons
private extension YouLoseScreen {
    
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
    
    var secondaryButton: some View {
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
