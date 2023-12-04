//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct CardView: View {
    
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card){
        self.card = card
    }
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                CirclePart(endAngle: .degrees(250))
                    .opacity(0.6)
                    .overlay(
                        Text(card.content).font(.system(size: 200))
                            .minimumScaleFactor(0.01)
                            .aspectRatio(1, contentMode: .fit)
                    )
                    .padding(4)
            }.opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0: 1)
        }.padding(.init(top: 2, leading: 5, bottom: 2, trailing: 5)).opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

//#Preview {
//    CardView(content: "😁")
//}
