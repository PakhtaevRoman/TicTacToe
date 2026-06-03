//
//  TIC_TAC_TOEApp.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 10.02.2026.
//
// Refactoring (рефакторинг)



import SwiftUI

@main
struct TIC_TAC_TOEApp: App {
    
    @StateObject private var router = AppRouter()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(router)
        }
    }
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
