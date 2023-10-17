//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let symbols: Array = ["😁", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️", "🤣", "😂", "🥰", "😘", "😛", "😋", "🌶️", "🫑", "🍞", "🧅"]
    @State var numCards: Int = 4
    
    var numCardsAdjuster: some View {
        HStack {
            buttonMinus
            Spacer()
            buttonPlus
        }.padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach (0..<numCards, id: \.self) {index in
                CardView(content: symbols[index]).aspectRatio(2/1, contentMode: .fit).foregroundColor(.blue)
            }
        }
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        symbol == "+" ?
            Button(symbol) {
                if (numCards/2 < symbols.count/2) {
                    numCards += 2
                }
            }.font(.largeTitle).disabled(numCards >= symbols.count).frame(width: 55, height: 45).border(.blue, width: 2).cornerRadius(4)
            :
            Button(symbol) {
                if (numCards > 0) {
                    numCards -= 2
                }
            }.font(.largeTitle).disabled(numCards == 0).frame(width: 55, height: 45).border(.blue, width: 2).cornerRadius(4)
    }
    
    var buttonPlus: some View {
        adjustCardNumber(by: 2, symbol: "+")
    }
    
    var buttonMinus: some View {
        adjustCardNumber(by: -2, symbol: "-")
    }

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            numCardsAdjuster
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
