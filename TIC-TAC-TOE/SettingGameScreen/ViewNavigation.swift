//
//  ViewNavigation.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 25.06.2026.
//

import SwiftUI

extension View {

    func gameNavigationHidden() -> some View {
        self
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}
