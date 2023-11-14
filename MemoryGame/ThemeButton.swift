//
//  ThemeButton.swift
//  MemoryGame
//
//  Created by student on 23/10/2023.
//

import SwiftUI

struct ThemeButton: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    let symbol: String
    let text: String
    let pairNum: Int
    let themeId: Int
    let color: Color
    
    var body: some View {
        VStack {
            Image(systemName: symbol).font(.largeTitle)
            Text(text).font(.footnote)
        }
        .onTapGesture {
            viewModel.selectedColor = color
            viewModel.setTheme(pairNum: pairNum, themeId: themeId)
            viewModel.shuffle()
        }.foregroundColor(viewModel.selectedColor)
    }
}

#Preview {
    ThemeButton(viewModel: MemoGameViewModel(), symbol: "snowflake.circle", text: "Blue", pairNum: 4, themeId: 2, color: .blue)
}
