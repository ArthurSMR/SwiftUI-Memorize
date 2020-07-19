//
//  MemoryGame.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 29/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]
    var theme: Theme<CardContent>
    var score = 0
    var seenCards: [Card] = []
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
            //            cards = cards.enumerated().map { (elementEnumerated) -> Card in
            //                var element = elementEnumerated.element
            //                element.isFaceUp = elementEnumerated.offset == newValue
            //                return element
            //            }
        }
    }
    
    mutating func choose(card: Card) {
        
        if let chosenIndex = cards.firstIndex(matching: card),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    self.score += 2
                } else {
                    let mismatchCards = [cards[chosenIndex], cards[potentialMatchIndex]]
                    checkSeen(mismatchCards: mismatchCards)
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    /// This method is to check if the mismatch cards and calculate if you will lose 1 or 2 points
    /// - Parameter mismatchCards: potential match card and the first chosen card
    mutating func checkSeen(mismatchCards: [Card]) {
        
        for card in mismatchCards {
            
            let containsCard = seenCards.contains { $0.id == card.id }
            
            if containsCard {
                self.score -= 1
            } else {
                self.seenCards.append(card)
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    init(numberOfPairsOfCards: Int, theme: Theme<CardContent>, cardContentFactory: (Int) -> CardContent) {
        cards = []
        self.theme = theme
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards.shuffle()
    }
}
