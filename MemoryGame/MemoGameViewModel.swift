//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 13/11/2023.
//

import SwiftUI

class MemoGameViewModel {
    private static let symbols = ["😁", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️", "😁", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️"]
    
    private var model = MemoGameViewModel.createMemoGame()
    
    static func createMemoGame() -> MemoGameModel<String> {
        return MemoGameModel<String>(
            numberOfPairsOfCards: 4
        ) { index in
            if index < symbols.count {
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
    
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card: card)
    }
}
