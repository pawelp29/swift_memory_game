//
//  CirclePartView.swift
//  MemoryGame
//
//  Created by student on 04/12/2023.
//

import SwiftUI

struct CirclePartView: View {
    var body: some View {
        CirclePart(endAngle: .degrees(240)).foregroundColor(.blue).opacity(0.6).transformIntoCard(isFaceUp: true).foregroundColor(.orange)
    }
}

#Preview {
    CirclePartView()
}
