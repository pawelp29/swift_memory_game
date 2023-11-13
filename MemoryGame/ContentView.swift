//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
//    @State var symbols: Array = ["😁", "😅", "😍", "🙃", "🙂", "☺️", "😅", "😊", "😍", "🙃", "🙂", "😇", "☺️", "😁", "😇", "😊"]
//    @State var numCards: Int = 4
    @State var selectedColor: Color = .green
    
//    var numCardsAdjuster: some View {
//        HStack {
//            buttonMinus
//            Spacer()
//            buttonPlus
//        }.padding()
//    }
    
//    func shuffleSymbols(symbolsArray: Array<String>) {
//        symbols = symbolsArray.shuffled()
//    }
//    
//    func changeColor(newColor: Color) {
//        selectedColor = newColor
//    }
    
    var themeAdjuster: some View {
        HStack {
            ThemeButton(symbol: "leaf.circle", text: "Green", action: {
                selectedColor = .green
                viewModel.setTheme(pairNum: 10, themeId: 0)
                viewModel.shuffle()
            }).foregroundColor(selectedColor)
            Spacer()
            ThemeButton(symbol: "flame.circle", text: "Red", action: {
                selectedColor = .red
                viewModel.setTheme(pairNum: 6, themeId: 1)
                viewModel.shuffle()
            }).foregroundColor(selectedColor)
            Spacer()
            ThemeButton(symbol: "snowflake.circle", text: "Blue", action: {
                selectedColor = .blue
                viewModel.setTheme(pairNum: 4, themeId: 2)
                viewModel.shuffle()
            }).foregroundColor(selectedColor)
        }
    }
    
    var shuffleButton: some View {
        Button("Shuffle") {
            viewModel.shuffle()
        }.font(.headline)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit).foregroundColor(selectedColor)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
    }
//    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        symbol == "+" ?
//            Button(symbol) {
//                if (numCards/2 < symbols.count/2) {
//                    numCards += 2
//                }
//            }.font(.largeTitle).disabled(numCards >= symbols.count).frame(width: 55, height: 45).border(.blue, width: 2).cornerRadius(4)
//            :
//            Button(symbol) {
//                if (numCards > 0) {
//                    numCards -= 2
//                }
//            }.font(.largeTitle).disabled(numCards == 0).frame(width: 55, height: 45).border(.blue, width: 2).cornerRadius(4)
//    }
    
//    var buttonPlus: some View {
//        adjustCardNumber(by: 2, symbol: "+")
//    }
//    
//    var buttonMinus: some View {
//        adjustCardNumber(by: -2, symbol: "-")
//    }

    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle).foregroundColor(selectedColor)
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Spacer()
            shuffleButton.padding(.bottom).foregroundColor(selectedColor)
            themeAdjuster
//            numCardsAdjuster
//            themeAdjuster
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
