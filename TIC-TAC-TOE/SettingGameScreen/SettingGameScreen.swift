//
//  SettingGameScreen.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 12.06.2026.
//

import SwiftUI

struct SettingGameScreen<ViewModel: SettingGameViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            Color("BackgroundMain")
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack {
                    header
                    settingsBlock
                    skinsGrid
                }
            }
        }
        .gameNavigationHidden()
    }
}

// MARK: - Header
private extension SettingGameScreen {
    
    var header: some View {
        HStack {
            Button {
                viewModel.didTapBack()
            } label: {
                Image("Icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 22)
            }
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.leading, 21)
    }
}

// MARK: - Settings

private extension SettingGameScreen {

    var settingsBlock: some View {
        VStack(spacing: 20) {

            // Game Time
            HStack {
                Text("Game Time")
                    .font(.system(size: 20, weight: .semibold))

                Spacer()

                Toggle(
                    "",
                    isOn: Binding(
                        get: { viewModel.viewItem.isGameTimeEnabled },
                        set: { _ in
                            viewModel.didToggleGameTime()
                        }
                    )
                )
                .labelsHidden()
                .tint(Color("Blue"))
            }
            .padding(.horizontal, 20)
            .frame(height: 69)
            .background(Color("Light-blue"))
            .cornerRadius(30)

            // Duration
            Group {
                if viewModel.viewItem.isGameTimeEnabled {
                    VStack(spacing: 0) {
                        Text("Duration")
                            .frame(height: 44)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                            .foregroundColor(.black)
                            .overlay(
                                Rectangle()
                                    .fill(Color("Blue"))
                                    .frame(height: 1),
                                alignment: .bottom
                            )

                        ForEach(DurationOption.allCases, id: \.self) { option in
                            durationRow(option)
                        }
                    }
                    .background(Color("Light-blue"))
                    .cornerRadius(30)
                    .transition(.opacity)
                }
            }
        }
        .animation(
            .easeInOut(duration: 0.25),
            value: viewModel.viewItem.isGameTimeEnabled
        )
        .padding(20)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(
            color: Color.black.opacity(0.15),
            radius: 10,
            x: 4,
            y: 4
        )
        .padding(.horizontal, 21)
        .padding(.top)
    }

    func durationRow(_ option: DurationOption) -> some View {
        let isSelected = viewModel.viewItem.selectedDuration == option

        return ZStack(alignment: .leading) {
            if isSelected {
                Color("Purple")
            }

            Text(option.rawValue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
        }
        .frame(height: 44)
        .onTapGesture {
            viewModel.didSelectDuration(option)
        }
    }
}

// MARK: - Skins Grid
private extension SettingGameScreen {
    
    var skinsGrid: some View {
        
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        return LazyVGrid(columns: columns, spacing: 20) {
            
            ForEach(Array(viewModel.viewItem.skins.enumerated()), id: \.element.id) { index, skin in
                
                SkinCardView(
                    skin: skin,
                    isSelected: viewModel.viewItem.selectedSkinIndex == index
                ) {
                    viewModel.didSelectSkin(index: index)
                }
            }
        }
        .padding(.horizontal, 21)
        .padding(.top, 20)
    }
}
