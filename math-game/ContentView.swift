//
//  ContentView.swift
//  math-game
//
//  Created by Logan  Jackson on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var time = 30.0
    var body: some View {
        if (isActive) {
            GameView(t: time)
        }
        else {
            VStack {
                Button(action: {
                    isActive = true
                }) {
                    Text("🧮 Begin Game")
                        .font(.title)
                }
                HStack{
                    Picker("Time", selection: $time) {
                        Text("1 second").tag(1.0)
                        Text("30 seconds").tag(30.0)
                        Text("60 seconds").tag(60.0)
                        Text("120 seconds").tag(120.0)
                    }
                    .pickerStyle(.menu)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
