//
//  ScoreView.swift
//  math-game
//
//  Created by Logan  Jackson on 9/16/23.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    @State private var isActive = false
    var body: some View {
        if (isActive) {
            ContentView()
        }
        else {
            VStack {
                Text("You Scored: \(score)")
                    .font(.title)
                    .padding(.bottom)
                Button(action: {
                    isActive = true
                }) {
                    Text("Try Again")
                        .font(.title2)
                }
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(score: 0)
    }
}
