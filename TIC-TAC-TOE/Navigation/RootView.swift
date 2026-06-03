//
//  RootView.swift
//  TIC-TAC-TOE
//
//  Created by Evgeniy K on 03.06.2026.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var router: AppRouter
    
    var body: some View {
        NavigationView {
            
            ZStack {
                
                // HOME всегда корень
                HomeScreen(
                    viewModel: HomeViewModel(
                        onNavigate: { route in
                            router.push(route)
                        }
                    )
                )
                
                // SELECT GAME (скрытый navigation link)
                NavigationLink(
                    destination: SelectGameScreen(
                        viewModel: SelectGameViewModel(
                            onNavigate: { route in
                                router.push(route)
                            }
                        )
                    ),
                    isActive: Binding(
                        get: { router.path.contains(.selectGame) },
                        set: { isActive in
                            if !isActive {
                                router.pop()
                            }
                        }
                    )
                ) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
