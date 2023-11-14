//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 13/11/2023.
//

import SwiftUI

class MemoGameViewModel: ObservableObject {
//    private static let symbols = ["😁", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️", "🌶️", "🫑", "🍞", "🧅", "🥝", "🍕", "✈️", "🚄", "🚔", "🚑"]
    
    private static let symbols1 = ["😁", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️"]
    private static let symbols2 = ["🌶️", "🫑", "🍞", "🧅", "🥝", "🍕", "🍒", "🍊"]
    private static let symbols3 = ["✈️", "🚄", "🚔", "🚑"]
    private static let symbols = [symbols1, symbols2, symbols3]
    
    @Published private var model = MemoGameViewModel.createMemoGame()
    @Published var selectedColor = Color.green
    
    static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(
            numberOfPairsOfCards: 8
        ) { index in
            if symbols[0].indices.contains(index) {
                return symbols[0][index]
            }
            else {
                return "??"
            }
        }
    }
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func setTheme(pairNum: Int, themeId: Int) {
        model.setTheme(pairNum: pairNum, cardContentFactory: { index in
            if MemoGameViewModel.symbols[themeId].indices.contains(index) {
                return MemoGameViewModel.symbols[themeId][index]
            }
            else {
                return "??"
            }
        })
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
}
