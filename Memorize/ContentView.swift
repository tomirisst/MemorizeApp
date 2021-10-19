//
//  ContentView.swift
//  Memorize
//
//  Created by Tomiris Sayat on 14.10.2021.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["⛵️", "🛶", "⛱", "🏝", "🚀", "🚗", "🚑", "🛵", "🚨", "🚔", "🚧", "🗿", "🚢", "⚓️", "🌋", "⛺️", "🗽", "🛣", "🌄", "⛩", "🕌", "🏡", "🎡", "🚒"]
    @State var emojiCount = 4
    //[String] = Array<String>
    //emojis[0..<6] - from 0 to 6(not including 6)
    //emojis[0...6] - from 0 to 6 (including 6)
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            
            Spacer()
            
            HStack {
                removeCard
                Spacer()
                addCard
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var removeCard: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        }
    }
    
    var addCard: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
            }
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
