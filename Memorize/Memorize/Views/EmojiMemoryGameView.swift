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
        VStack {
            Spacer()
            Text("Pontuação: \(viewModel.score)")
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.6)) {
                        self.viewModel.choose(card: card)
                    }
                } // CardView
                    .padding(5)
            } // Grid
                .foregroundColor(viewModel.theme.color)
                .navigationBarTitle(Text(viewModel.chosenTheme.rawValue), displayMode: .inline)
                .navigationBarItems(trailing: ResetButton(viewModel: viewModel))
        } // VStack
    } // NavigationView
}

struct ResetButton: View {
    
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        Button(action: self.restartGame){
            Image(systemName: "arrow.counterclockwise")
        }
    }
    
    func restartGame() {
        withAnimation(.easeInOut) {
            self.viewModel.restart(with: viewModel.chosenTheme)
        }
    }
}


struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body: some View {
        
        GeometryReader(content:  { geometry in
            self.body(for: geometry.size)
        }) // GeometryReader
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(110 - 90), clockWise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear.repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Drawing constants
    
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGameViewModel(chosenTheme: .food)
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
