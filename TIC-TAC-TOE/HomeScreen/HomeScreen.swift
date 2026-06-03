//
//  ContentView.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 10.02.2026.
//
//
//
import SwiftUI

struct HomeScreen<ViewModel: HomeViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            backgroundView
            
            VStack {
                topContent
                
                Spacer()
                
                middleContent
                
                Spacer()
                
                bottomContent
            }
        }
    }
}

// MARK: - Background
private extension HomeScreen {
    
    var backgroundView: some View {
        Color.white
            .ignoresSafeArea()
    }
}

// MARK: - Top Content
private extension HomeScreen {
    
    var topContent: some View {
        HStack {
            
            helpButton
            
            Spacer()
            
            settingsButton
        }
        .padding(.horizontal, 21)
        .padding(.top, 10)
    }
    
    var helpButton: some View {
        Button {
            viewModel.didTapHelp()
        } label: {
            Image(viewModel.viewItem.helpIconName)
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
        }
    }
    
    var settingsButton: some View {
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
private extension HomeScreen {
    
    var middleContent: some View {
        VStack {
            
            logoView
            
            titleView
        }
    }
    
    var logoView: some View {
        HStack(alignment: .bottom, spacing: 0) {
            
            Image(viewModel.viewItem.logoLeftName)
                .resizable()
                .scaledToFit()
                .frame(width: 108, height: 107)
            
            Image(viewModel.viewItem.logoRightName)
                .resizable()
                .scaledToFit()
                .frame(width: 136, height: 135)
        }
        .padding(.leading, 24)
        .padding(.top, 26)
    }
    
    var titleView: some View {
        Text(viewModel.viewItem.title)
            .font(.system(size: 32, weight: .bold))
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding(.top, 30)
    }
}

// MARK: - Bottom Content
private extension HomeScreen {
    
    var bottomContent: some View {
        Button {
            viewModel.didTapPlay()
        } label: {
            Text(viewModel.viewItem.playButtonTitle)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 72)
        .background(Color(viewModel.viewItem.buttonColorName))
        .cornerRadius(30)
        .padding(.horizontal, 31)
        .padding(.bottom, 40)
    }
}

// MARK: - Preview
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(
            viewModel: HomeViewModel(onNavigate: { _ in })
        )
    }
}
