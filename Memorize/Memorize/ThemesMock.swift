//
//  ThemesMock.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 09/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class ThemesMock<CardContent> where CardContent: Equatable {
    
    static func getContent(for theme: Themes) -> Theme<String> {
        
        var emojis: [String]
        var themeContent: Theme<String>
        var color: Color
        
        
        switch theme {
        case .food:
            emojis = ["🍟", "🍭", "🧀", "🍖", "🍕"]
            color = .red
        case .halloween:
            emojis = ["👻", "🎃", "🕷", "🧙🏽‍♂️", "🧟‍♂️"]
            color = .orange
        case .faces:
            emojis = ["😄", "😇", "😈", "🥵", "🥰"]
            color = .blue
        case .animals:
            emojis = ["🐖", "🐸", "🦍", "🦕", "🦒"]
            color = .green
        case .flags:
            emojis = ["🇧🇷", "🇺🇸", "🇪🇸", "🇫🇷", "🇦🇷"]
            color = .gray
        case .objects:
            emojis = ["✏️", "✒️", "📏", "🔧", "📎"]
            color = .purple
        }
        
        let numberOfPairsOfCards: Int = Int.random(in: 2...emojis.count)
        
        themeContent = Theme<String>(name: theme.rawValue, content: emojis, color: color, numberOfPairsOfCards: numberOfPairsOfCards)
        return themeContent
    }
}
