//
//  HowToPlayViewItem.swift
//  TIC-TAC-TOE
//
//  Created by macbook on 16.06.2026.
//

import Foundation

struct HowToPlayViewItem {

    let title: String

    let backIconName: String
    let backgroundColorName: String

    let numberBackgroundColorName: String
    let textBackgroundColorName: String

    let rules: [Rule]
}

extension HowToPlayViewItem {
    
    struct Rule: Identifiable {
        
        let id = UUID()
        
        let number: String
        let text: String
    }
}
