//
//  ThemeViewModel.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 08/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    
    @Published private var memoryGameViewModel: MemoryGame<String>
    let chosenTheme: Themes
    
    static func createGame(with theme: Themes) -> MemoryGame<String> {
        
        let theme = ThemesMock<String>.getContent(for: theme)
        
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards, theme: theme) { (index) in
            theme.content[index]
        }
    }
    
    init(chosenTheme: Themes) {
        self.chosenTheme = chosenTheme
        self.memoryGameViewModel = MemoryGameViewModel.createGame(with: chosenTheme)
    }
    
    // MARK: - Access to the model
    
    var cards: [MemoryGame<String>.Card] {
        memoryGameViewModel.cards
    }
    
    var theme: Theme<String> {
        memoryGameViewModel.theme
    }
    
    var score: Int {
        memoryGameViewModel.score
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        memoryGameViewModel.choose(card: card)
    }
}

struct FoodMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

