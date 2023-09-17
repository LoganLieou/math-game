//
//  ContentView.swift
//  math-game
//
//  Created by Logan  Jackson on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        if (isActive) {
            GameView()
        }
        else {
            Button(action: {
                isActive = true
            }) {
                Text("🧮 Begin Game")
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
