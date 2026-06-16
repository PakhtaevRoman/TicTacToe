//
//  HowToPlayScreen.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 16.06.2026.
//

import SwiftUI

struct HowToPlayScreen<ViewModel: HowToPlayViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {

        ZStack {

            Color(viewModel.viewItem.backgroundColorName)
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack {

                    headerView

                    rulesView
                }
            }
        }
    }
}

// MARK: - Header

private extension HowToPlayScreen {

    var headerView: some View {

        HStack {

            Button {
                viewModel.didTapBack()
            } label: {

                Image(viewModel.viewItem.backIconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 22)
            }

            Spacer()

            Text(viewModel.viewItem.title)
                .font(.system(size: 24, weight: .bold))

            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 21)
    }
}

// MARK: - Rules

private extension HowToPlayScreen {

    var rulesView: some View {

        VStack(spacing: 16) {

            ForEach(viewModel.viewItem.rules) { rule in

                ruleItem(rule)
            }
        }
        .padding(.horizontal, 21)
        .padding(.top)
    }

    func ruleItem(
        _ rule: HowToPlayViewItem.Rule
    ) -> some View {

        HStack(spacing: 20) {

            Text(rule.number)
                .frame(width: 45, height: 45)
                .background(
                    Color(viewModel.viewItem.numberBackgroundColorName)
                )
                .cornerRadius(22.5)

            Text(rule.text)
                .padding()
                .background(
                    Color(viewModel.viewItem.textBackgroundColorName)
                )
                .cornerRadius(30)
        }
    }
}

// MARK: - Preview

struct HowToPlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayScreen(
            viewModel: HowToPlayViewModel(
                onNavigate: { _ in }
            )
        )
    }
}
