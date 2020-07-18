//
//  Themes.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 08/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

enum Themes: String, CaseIterable {
    case food = "🍕 Comidas"
    case halloween = "🎃 Halloween"
    case faces = "😃 Caras"
    case animals = "🐖 Animais"
    case flags = "🇧🇷 Bandeiras"
    case objects = "✏️ Objetos"
    
    static func random() -> Themes {
        
        let allCases = Themes.allCases
        let randomElement = Int.random(in: 0..<allCases.count)
        return allCases[randomElement]
    }
}
