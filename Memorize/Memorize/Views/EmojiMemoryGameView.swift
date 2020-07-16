//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 29/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        VStack(alignment: .trailing) {
            Spacer()
            Text("Pontuação: 0")
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                } // CardView
                    .padding(5)
            } // Grid
                .foregroundColor(viewModel.theme.color)
            .navigationBarTitle(Text(viewModel.chosenTheme.rawValue), displayMode: .inline)
        } // VStack
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        
        GeometryReader(content:  { geometry in
            self.body(for: geometry.size)
        }) // GeometryReader
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                }
            }
        } // ZStack
            .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: MemoryGameViewModel(chosenTheme: .food))
    }
}
