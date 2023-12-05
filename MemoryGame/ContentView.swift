//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 11/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: MemoGameViewModel
    
    @State private var lastScoreChange = (0, "")
    
    private func scoreChange(cardId: MemoGameModel<String>.Card.ID) -> Int{
        let (amount, id) = lastScoreChange
        return cardId == id ? amount : 0
    }
    
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
            ThemeButton(viewModel: viewModel, symbol: "leaf.circle", text: "Green", pairNum: 8, themeId: 0, color: .green)
            Spacer()
            ThemeButton(viewModel: viewModel, symbol: "flame.circle", text: "Red", pairNum: 6, themeId: 1, color: .red)
            Spacer()
            ThemeButton(viewModel: viewModel, symbol: "snowflake.circle", text: "Blue", pairNum: 4, themeId: 2, color: .blue)
        }
    }
    
    var shuffleButton: some View {
        Button("SHUFFLE") {
            withAnimation {
                viewModel.shuffle()
            }
        }.font(.headline)
    }
    
    private var score: some View{
        Text("Score: \(viewModel.score)")
            .animation(nil).foregroundColor(.black).font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit).foregroundColor(viewModel.selectedColor)
                    .padding(EdgeInsets(top: 1, leading: 4, bottom: 1, trailing: 4))
                    .overlay(FlyingNumber(number: scoreChange(cardId: card.id)))
                    .zIndex(scoreChange(cardId: card.id) != 0 ? 1 : 0)
                    .onTapGesture {
                        withAnimation {
                            let scoreBeforeChoosing = viewModel.score
                            viewModel.choose(card)
                            let scoreDiff = viewModel.score - scoreBeforeChoosing
                            lastScoreChange = (scoreDiff, card.id)
                        }
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
            Text("Memo").font(.largeTitle).foregroundColor(.black)
            ScrollView {
                cards.animation(.default, value: viewModel.cards)
            }
            Spacer()
            HStack {
                score
                Spacer()
                shuffleButton.padding(.init(top: 2, leading: 2, bottom: 4, trailing: 2))
            }
            themeAdjuster
//            numCardsAdjuster
        }.foregroundColor(viewModel.selectedColor)
        .padding()
    }
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
