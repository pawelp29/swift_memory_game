//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 04/12/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier {
    let isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
                .opacity(isFaceUp ? 1 : 0)
            base.fill()
                .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            .degrees(isFaceUp ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func transformIntoCard(isFaceUp: Bool) -> some View {
        modifier(TransformIntoCard(isFaceUp: isFaceUp))
    }
}
