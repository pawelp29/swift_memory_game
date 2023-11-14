//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
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
            ThemeButton(viewModel: viewModel, symbol: "leaf.circle", text: "Green", pairNum: 10, themeId: 0, color: .green)
            Spacer()
            ThemeButton(viewModel: viewModel, symbol: "flame.circle", text: "Red", pairNum: 8, themeId: 1, color: .red)
            Spacer()
            ThemeButton(viewModel: viewModel, symbol: "snowflake.circle", text: "Blue", pairNum: 4, themeId: 2, color: .blue)
        }
    }
    
    var shuffleButton: some View {
        Button("SHUFFLE") {
            viewModel.shuffle()
        }.font(.headline)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit).foregroundColor(viewModel.selectedColor)
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
            Text("Memo").font(.largeTitle)
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Spacer()
            shuffleButton.padding(.init(top: 2, leading: 2, bottom: 4, trailing: 2))
            themeAdjuster
//            numCardsAdjuster
        }.foregroundColor(viewModel.selectedColor)
        .padding()
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
