//
//  CirclePartView.swift
//  MemoryGame
//
//  Created by student on 04/12/2023.
//

import SwiftUI

struct CirclePartView: View {
    var body: some View {
        CirclePart(endAngle: .degrees(210)).transformIntoCard(isFaceUp: true)
    }
}

#Preview {
    CirclePartView()
}
