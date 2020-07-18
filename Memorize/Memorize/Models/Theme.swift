//
//  Theme.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 08/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

class Theme<CardContent> where CardContent: Equatable {
    var name: String
    var content: [CardContent]
    var color: Color
    var numberOfPairsOfCards: Int
    
    init(name: String, content: [CardContent], color: Color, numberOfPairsOfCards: Int) {
        self.name = name
        self.content = content
        self.color = color
        self.numberOfPairsOfCards = numberOfPairsOfCards
    }
}
