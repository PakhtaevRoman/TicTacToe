//
//  PlayingFieldTwoScreen.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

import SwiftUI

struct PlayingFieldTwoScreen<ViewModel: PlayingFieldTwoViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {

        ZStack {

            backgroundView

            VStack {

                topBar

                gameInfoBlock

                turnInfo

                gameGrid

                Spacer()
            }
        }
    }
}
// MARK: - Background
private extension PlayingFieldTwoScreen {

    var backgroundView: some View {

        Color(viewModel.viewItem.backgroundColorName)
            .ignoresSafeArea()
    }
}
// MARK: - Top Bar
private extension PlayingFieldTwoScreen {

    var topBar: some View {

        HStack {

            Button {
                viewModel.didTapBack()
            } label: {
                Image(viewModel.viewItem.backButtonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 22)
            }

            Spacer()
        }
        .padding(.horizontal, 26.62)
        .padding(.top, 73)
    }
}

// MARK: - Game Info
private extension PlayingFieldTwoScreen {

    var gameInfoBlock: some View {

        HStack {

            playerCard(
                image: viewModel.viewItem.playerOneImage,
                title: viewModel.viewItem.playerOneName
            ) {
                viewModel.didTapPlayerOne()
            }

            Spacer()

            timerView

            Spacer()

            playerCard(
                image: viewModel.viewItem.playerTwoImage,
                title: viewModel.viewItem.playerTwoName
            ) {
                viewModel.didTapPlayerTwo()
            }
        }
        .padding(.horizontal, 30)
        .padding(.top)
    }

    func playerCard(
        image: String,
        title: String,
        action: @escaping () -> Void
    ) -> some View {

        VStack {

            Button(action: action) {

                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 53)
            }

            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color("TitleBlack"))
        }
        .frame(width: 103, height: 103)
        .background(Color("ButtonLightBlue"))
        .cornerRadius(30)
    }

    var timerView: some View {

        Text(viewModel.viewItem.timerText)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(Color("TitleBlack"))
    }
}

//MARK: - Turn Infu
private extension PlayingFieldTwoScreen {

    var turnInfo: some View {

        HStack {

            Image(viewModel.viewItem.turnImage)
                .resizable()
                .scaledToFit()
                .frame(height: 53)

            Text(viewModel.viewItem.turnTitle)
                .font(.system(size: 20, weight: .bold))
        }
        .padding(.top, 45)
    }
}
// MARK: - Game Grid
private extension PlayingFieldTwoScreen {

    var gameGrid: some View {

        VStack {

            ForEach(0..<3, id: \.self) { row in

                HStack(spacing: 20) {

                    ForEach(0..<3, id: \.self) { col in

                        cellButton(
                            value: viewModel.board[row][col]
                        ) {
                            viewModel.didTapCell(
                                row: row,
                                col: col
                            )
                        }
                    }
                }
            }
        }
        .frame(width: 302, height: 299)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.top, 44)
    }

    func cellButton(
        value: String,
        action: @escaping () -> Void
    ) -> some View {

        Button(action: action) {

            ZStack {

                RoundedRectangle(cornerRadius: 20)
                    .fill(
                        Color(
                            viewModel.viewItem.cellColorName
                        )
                    )
                    .frame(width: 74, height: 73)

                Text(value)
                    .font(.largeTitle)
            }
        }
    }
}

struct PlayingFieldTwoScreen_Previews: PreviewProvider {

    static var previews: some View {

        PlayingFieldTwoScreen(
            viewModel: PlayingFieldTwoViewModel(
                onNavigate: { _ in }
            )
        )
    }
}
