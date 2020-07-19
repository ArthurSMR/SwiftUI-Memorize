//
//  ThemesView.swift
//  Memorize
//
//  Created by Arthur Rodrigues on 10/07/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct ThemesView: View {
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(Themes.allCases.enumerated()), id: \.element) { theme in
                    NavigationLink(destination: EmojiMemoryGameView(viewModel: MemoryGameViewModel(chosenTheme: theme.element))) {
                        ThemeCell(theme: theme.element)
                    }
                } // ForEach
                Section {
                    RandomGameCell()
                }
            } // List
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Temas", displayMode: .automatic)
        } // NavigationView
    }
}

struct RandomGameCell: View {
    
    @State var randomTheme = Themes.random()
    @State var themeChanged = false
    
    var body: some View {
        NavigationLink(destination: EmojiMemoryGameView(viewModel: MemoryGameViewModel(chosenTheme: randomTheme)), isActive: $themeChanged) {
            Text("🔀 Jogo aleatório")
                .onTapGesture {
                    self.changeTheme()
            }
        } // NavigationLink
    }
    
    func changeTheme() {
        self.randomTheme = Themes.random()
        themeChanged.toggle()
    }
}

struct ThemeCell: View {
    
    var theme: Themes
    
    var body: some View {
        HStack {
            Text(theme.rawValue)
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
