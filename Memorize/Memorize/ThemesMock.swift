//
//  ThemesMock.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 09/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

class ThemesMock<CardContent> where CardContent: Equatable {
    
    static func getContent(with theme: Themes) -> Theme<String> {
        
        var emojis: [String]
        var themeString: Theme<String>
        
        switch theme {
        case .food:
            emojis = ["🍟", "🍭", "🧀", "🍖", "🍕"]
        case .halloween:
            emojis = ["👻", "🎃", "🕷", "🧙🏽‍♂️", "🧟‍♂️"]
        case .faces:
            emojis = ["😄", "😇", "😈", "🥵", "🥰"]
        case .animals:
            emojis = ["🐖", "🐸", "🦍", "🦕", "🦒"]
        case .flags:
            emojis = ["🇧🇷", "🇺🇸", "🇪🇸", "🇫🇷", "🇦🇷"]
        case .objects:
            emojis = ["✏️", "✒️", "📏", "🔧", "📎"]
        }
        themeString = Theme<String>(name: theme.rawValue, content: emojis)
        return themeString
    }
}
