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
    
    var cardAdder: some View {
        Button("+") {
            if (numCards/2 < symbols.count/2) {
                numCards += 2
            }
        }.font(.largeTitle).buttonStyle(.borderedProminent).disabled(numCards >= symbols.count)
    }
    
    var cardRemover: some View {
        Button("-") {
            if (numCards > 0) {
                numCards -= 2
            }
        }.font(.largeTitle).buttonStyle(.borderedProminent).disabled(numCards == 0)
    }
    
    var numCardsAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.padding()
    }
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach (0..<numCards, id: \.self) {index in
                CardView(content: symbols[index]).aspectRatio(1/1, contentMode: .fit).foregroundColor(.blue)
            }
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                cardDisplay
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
