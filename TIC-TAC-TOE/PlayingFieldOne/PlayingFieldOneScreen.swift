//
//  PlayingFieldOneScreen.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 18.06.2026.
//

//import SwiftUI
//
//struct PlayingFieldOneScreen<ViewModel: PlayingFieldOneViewModelProtocol>: View {
//
//    @ObservedObject var viewModel: ViewModel
//
//    var body: some View {
//
//        ZStack {
//
//            backgroundView
//
//            VStack {
//
//                topContent
//
//                playersContent
//
//                turnText
//
//                gameBoard
//
//                Spacer()
//            }
//        }
//        .gameNavigationHidden()
//    }
//}
//
//// MARK: - Background
//private extension PlayingFieldOneScreen {
//
//    var backgroundView: some View {
//        Color(viewModel.viewItem.backgroundColorName)
//            .ignoresSafeArea()
//    }
//}
//
//// MARK: - Top Content
//private extension PlayingFieldOneScreen {
//
//    var topContent: some View {
//
//        HStack {
//
//            Button {
//                viewModel.didTapBack()
//            } label: {
//                Image(viewModel.viewItem.backButtonImage)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 22)
//            }
//
//            Spacer()
//        }
//        .padding(.horizontal, 21)
//        .padding(.top, 50)
//    }
//}
//
//// MARK: - Players
//private extension PlayingFieldOneScreen {
//
//    var playersContent: some View {
//
//        HStack {
//
//            playerCard(
//                image: viewModel.viewItem.playerOneImage,
//                name: viewModel.viewItem.playerOneName
//            )
//
//            Spacer()
//
//            playerCard(
//                image: viewModel.viewItem.playerTwoImage,
//                name: viewModel.viewItem.playerTwoName
//            )
//        }
//        .padding(.horizontal, 30)
//        .padding(.top)
//    }
//
//    func playerCard(
//        image: String,
//        name: String
//    ) -> some View {
//
//        VStack {
//
//            Image(image)
//                .resizable()
//                .scaledToFit()
//                .frame(height: 53)
//
//            Text(name)
//                .font(.system(size: 17, weight: .semibold))
//                .foregroundColor(Color("TitleBlack"))
//        }
//        .frame(width: 103, height: 103)
//        .background(Color("ButtonLightBlue"))
//        .cornerRadius(30)
//    }
//}
//
//// MARK: - Turn Text
//private extension PlayingFieldOneScreen {
//
//    var turnText: some View {
//
//        Text(viewModel.viewItem.turnTitle)
//            .font(.system(size: 20))
//            .padding(.top, 45)
//    }
//}
//
//// MARK: - Board
//private extension PlayingFieldOneScreen {
//
//    var gameBoard: some View {
//
//        VStack {
//
//            ForEach(0..<3, id: \.self) { row in
//
//                HStack(spacing: 20) {
//
//                    ForEach(0..<3, id: \.self) { col in
//
//                        cellView(
//                            value: viewModel.board[row][col]
//                        ) {
//                            viewModel.didTapCell(
//                                row: row,
//                                col: col
//                            )
//                        }
//                    }
//                }
//            }
//        }
//        .frame(width: 302, height: 299)
//        .background(Color.white)
//        .cornerRadius(30)
//        .padding(.top, 44)
//    }
//
//    func cellView(
//        value: String,
//        action: @escaping () -> Void
//    ) -> some View {
//
//        Button(action: action) {
//
//            ZStack {
//
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(
//                        Color(
//                            viewModel.viewItem.cellBackgroundColorName
//                        )
//                    )
//                    .frame(width: 74, height: 73)
//
//                Text(value)
//                    .font(.largeTitle)
//            }
//        }
//    }
//}
//
//struct PlayingFieldOneScreen_Previews: PreviewProvider {
//
//    static var previews: some View {
//
//        PlayingFieldOneScreen(
//            viewModel: PlayingFieldOneViewModel(
//                onNavigate: { _ in }
//            )
//        )
//    }
//}
