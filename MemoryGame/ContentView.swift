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
    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        
//    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<numCards/2, id: \.self) {index in
                    HStack {
                        CardView(content: symbols[2*index]).foregroundColor(.blue)
                        CardView(content: symbols[2*index+1]).foregroundColor(.blue)
                    }.frame(height: 100)
                }
            }
            Spacer()
            HStack {
                Button("-") {
                    if (numCards > 0) {
                        numCards -= 2
                    }
                }.font(.largeTitle)
                Spacer()
                Button("+") {
                    if (numCards < symbols.count) {
                        numCards += 2
                    }
                }.font(.largeTitle)
            }.padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
