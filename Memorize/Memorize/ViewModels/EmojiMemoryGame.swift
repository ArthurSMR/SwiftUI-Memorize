//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 29/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "🧙🏽‍♂️", "🧟‍♂️"]
        
        let pairs = Int.random(in: 2...5)
        
        return MemoryGame<String>(numberOfPairsOfCards: pairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
