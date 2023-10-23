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
            Text(text)
        }
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    ThemeButton(symbol: "0", text: "Tekst", action: {})
}
