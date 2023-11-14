//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = []
        setTheme(pairNum: 8, cardContentFactory: cardContentFactory)
        self.cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    mutating func setTheme(pairNum: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, pairNum) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:"\(pairIndex+1)a", content: content))
            cards.append(Card(id:"\(pairIndex+1)b", content: content))
        }
    }
    
    struct Card: Equatable, Identifiable {
        var id: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }

}
