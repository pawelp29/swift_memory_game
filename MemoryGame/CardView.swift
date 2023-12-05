//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct CardView: View {
    
    var card: MemoGameModel<String>.Card
    
    private var rotationAngle: Double = 0
    
    init(_ card: MemoGameModel<String>.Card){
        self.card = card
    }
    
    var body: some View {
        CirclePart(endAngle: .degrees(240))
            .opacity(0.6)
            .overlay(
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(4)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? .spin(duration: 2) : .default, value: card.isMatched)
                
            )
            .padding(4)
            .transformIntoCard(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}


//#Preview {
//    CardView(content: "😁")
//}
