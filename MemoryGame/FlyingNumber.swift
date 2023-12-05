//
//  FlyingNumber.swift
//  MemoryGame
//
//  Created by student on 05.12.2023.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    @State private var offset: CFloat = 0
    var body: some View {
        if number != 0{
            Text(number, format: .number.sign(strategy: .always()))
                .font(.largeTitle)
                .foregroundColor(number < 0 ? .red : .blue)
                .shadow(color: .black, radius: 2, x: 1.5, y: 1.5)
                .offset(x: 0, y: CGFloat(offset))
                .opacity(offset != 0 ? 0 : 1)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.5)){
                        offset = number < 0 ? 100 : -100
                    }
                }
                .onDisappear{
                    offset = 0
                }
                
        }
    }
}

#Preview {
    FlyingNumber(number: 4)
}
