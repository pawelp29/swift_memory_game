//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 23/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    let symbol: String
    let text: String
    let action: () -> ()
    var body: some View {
        VStack {
            Image(systemName: symbol).font(.largeTitle)
            Text(text).font(.footnote)
        }
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ThemeButton(symbol: "paperplane.circle", text: "Tekst", action: {})
}
