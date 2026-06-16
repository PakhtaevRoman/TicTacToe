//
//  RootView.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import SwiftUI

//struct RootView: View {
//
//    @EnvironmentObject var router: AppRouter
//
//    var body: some View {
//        NavigationView {
//
//            ZStack {
//
//                HomeScreen(
//                    viewModel: HomeViewModel(
//                        onNavigate: { route in
//                            router.push(route)
//                        }
//                    )
//                )
//
//                // SELECT GAME
//                NavigationLink(
//                    destination: SelectGameScreen(
//                        viewModel: SelectGameViewModel(
//                            onNavigate: { route in
//                                router.push(route)
//                            }
//                        )
//                    ),
//                    isActive: Binding(
//                        get: { router.path.contains(.selectGame) },
//                        set: { isActive in
//                            if !isActive {
//                                router.pop()
//                            }
//                        }
//                    )
//                ) {
//                    EmptyView()
//                }
//
//                // SETTINGS GAME 👇 НОВЫЙ ЭКРАН
//                NavigationLink(
//                    destination: SettingGameScreen(
//                        viewModel: SettingGameViewModel(
//                            onNavigate: { route in
//                                router.push(route)
//                            }
//                        )
//                    ),
//                    isActive: Binding(
//                        get: { router.path.contains(.settingsGame) },
//                        set: { isActive in
//                            if !isActive {
//                                router.pop()
//                            }
//                        }
//                    )
//                ) {
//                    EmptyView()
//                }
//
//                // YOU LOSE 👇 НОВЫЙ ЭКРАН
//                NavigationLink(
//                    destination: YouLoseScreen(
//                        viewModel: YouLoseViewModel(
//                            onNavigate: { route in
//                                router.push(route)
//                            }
//                        )
//                    ),
//                    isActive: Binding(
//                        get: { router.path.contains(.youLose) },
//                        set: { isActive in
//                            if !isActive {
//                                router.pop()
//                            }
//                        }
//                    )
//                ) {
//                    EmptyView()
//                }
//
//                // DRAW 👇 НОВЫЙ ЭКРАН
//                NavigationLink(
//                    destination: DrawScreen(
//                        viewModel: DrawViewModel(
//                            onNavigate: { route in
//                                router.push(route)
//                            }
//                        )
//                    ),
//                    isActive: Binding(
//                        get: { router.path.contains(.draw) },
//                        set: { isActive in
//                            if !isActive {
//                                router.pop()
//                            }
//                        }
//                    )
//                ) {
//                    EmptyView()
//                }
//
//                // PLAYERWIN 👇 НОВЫЙ ЭКРАН
//                NavigationLink(
//                    destination: PlayerWinScreen(
//                        viewModel: PlayerWinViewModel(
//                            onNavigate: { route in
//                                router.push(route)
//                            }
//                        )
//                    ),
//                    isActive: Binding(
//                        get: { router.path.contains(.playerWin) },
//                        set: { isActive in
//                            if !isActive {
//                                router.pop()
//                            }
//                        }
//                    )
//                ) {
//                    EmptyView()
//                }
//
//                // HOW TO PLAY 👇 НОВЫЙ ЭКРАН
//                NavigationLink(
//                    destination: HowToPlayScreen(
//                        viewModel: HowToPlayViewModel(
//                            onNavigate: { route in
//                                router.push(route)
//                            }
//                        )
//                    ),
//                    isActive: Binding(
//                        get: { router.path.contains(.howToPlay) },
//                        set: { isActive in
//                            if !isActive {
//                                router.pop()
//                            }
//                        }
//                    )
//                ) {
//                    EmptyView()
//                }
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}

struct RootView: View {

    @EnvironmentObject var router: AppRouter

    var body: some View {
        NavigationView {
            ZStack {

                HomeScreen(
                    viewModel: HomeViewModel(
                        onNavigate: router.push
                    )
                )

                navigationLinks
            }
            .navigationBarHidden(true)
        }
    }
}

private extension RootView {

    var navigationLinks: some View {

        Group {

            NavigationLink(
                destination: SelectGameScreen(
                    viewModel: SelectGameViewModel(onNavigate: router.push)
                ),
                isActive: Binding(
                    get: { router.currentRoute == .selectGame },
                    set: { if !$0 { router.pop() } }
                )
            ) { EmptyView() }

            NavigationLink(
                destination: SettingGameScreen(
                    viewModel: SettingGameViewModel(onNavigate: router.push)
                ),
                isActive: Binding(
                    get: { router.currentRoute == .settingsGame },
                    set: { if !$0 { router.pop() } }
                )
            ) { EmptyView() }

            NavigationLink(
                destination: YouLoseScreen(
                    viewModel: YouLoseViewModel(onNavigate: router.push)
                ),
                isActive: Binding(
                    get: { router.currentRoute == .youLose },
                    set: { if !$0 { router.pop() } }
                )
            ) { EmptyView() }

            NavigationLink(
                destination: DrawScreen(
                    viewModel: DrawViewModel(onNavigate: router.push)
                ),
                isActive: Binding(
                    get: { router.currentRoute == .draw },
                    set: { if !$0 { router.pop() } }
                )
            ) { EmptyView() }

            NavigationLink(
                destination: PlayerWinScreen(
                    viewModel: PlayerWinViewModel(onNavigate: router.push)
                ),
                isActive: Binding(
                    get: { router.currentRoute == .playerWin },
                    set: { if !$0 { router.pop() } }
                )
            ) { EmptyView() }

            NavigationLink(
                destination: HowToPlayScreen(
                    viewModel: HowToPlayViewModel(onNavigate: router.push)
                ),
                isActive: Binding(
                    get: { router.currentRoute == .howToPlay },
                    set: { if !$0 { router.pop() } }
                )
            ) { EmptyView() }
        }
    }
}
