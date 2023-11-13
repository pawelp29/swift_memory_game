//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 13/11/2023.
//

import SwiftUI

class MemoGameViewModel: ObservableObject {
    private static let symbols = ["😁", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️", "🌶️", "🫑", "🍞", "🧅", "🥝", "🍕", "✈️", "🚄", "🚔", "🚑"]
    
    @Published private var model = MemoGameViewModel.createMemoGame()
    
    static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(
            numberOfPairsOfCards: 8
        ) { index in
            if symbols.indices.contains(index) {
                return symbols[index]
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
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
}
