//
//  ContentView.swift
//  Memorize
//
//  Created by Tarun on 05/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["👻","🎃","😈","🕷️","💀","☠️","👽","🤖","👾","👿","👹"]
    
    @State var cardCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            Spacer()
            buttonsView
        }
        .padding()
    }
    
    var cards : some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundStyle(.orange)
    }
    
    var buttonsView: some View {
        HStack {
            halloweenThemeButton
            Spacer()
            carThemeButton
            Spacer()
            sportsThemeButton
        }
        .padding()
    }
    
    var halloweenThemeButton: some View {
        Button(action: {
            emojis = ["👻","🎃","😈","🕷️","💀","☠️","👽","🤖","👾","👿","👹"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "arrow.2.circlepath.circle")
                Text("Halloween")
            }
            .imageScale(.large)
        })
    }
    
    var carThemeButton: some View {
        Button(action: {
            emojis = ["🚗","🚙","🏎️","🚕","🚓"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "car")
                Text("Car")
            }
            .imageScale(.large)
        })
    }
    
    var sportsThemeButton: some View {
        Button(action: {
            emojis = ["⚽️","🏀","🏈","⚾️","🎾"].shuffled()
        }, label: {
            VStack {
                Image(systemName: "football")
                Text("Sports")
            }
            .imageScale(.large)
        })
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = false

    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.stroke(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0) // Adjusts opacity of emoji, if not used they would till change sizes
            base.fill().opacity(isFaceUp ? 0 : 1)
            
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}




























#Preview {
    ContentView()
}
