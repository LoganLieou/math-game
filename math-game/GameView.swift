//
//  GameView.swift
//  math-game
//
//  Created by Logan  Jackson on 9/16/23.
//

import SwiftUI

var res = ""

func generateProblem() -> String {
    let opn = Int.random(in: 1...4)
    var op = "", fst = 0, snd = 0
    switch opn {
    case 1:
        op = "+"
        fst = Int.random(in: 2...100)
        snd = Int.random(in: 2...100)
        res = "\(fst + snd)"
    case 2:
        op = "-"
        fst = Int.random(in: 2...100)
        snd = Int.random(in: 2...100)
        while (snd > fst) {
            fst = Int.random(in: 2...100)
            snd = Int.random(in: 2...100)
        }
        res = "\(fst - snd)"
    case 3:
        op = "*"
        fst = Int.random(in: 2...12)
        snd = Int.random(in: 2...100)
        res = "\(fst * snd)"
    case 4:
        op = "/"
        fst = Int.random(in: 2...100)
        snd = Int.random(in: 2...100)
        while ((Double(fst) / Double(snd)).truncatingRemainder(dividingBy: 1) != 0) {
            fst = Int.random(in: 2...100)
            snd = Int.random(in: 2...100)
        }
        res = "\(fst / snd)"
    default:
        op = ""
        res = "0"
    }
    return "\(fst) \(op) \(snd)"
}

struct GameView: View {
    // Constructor
    let t: Double
    @State private var problemString = generateProblem()
    @State private var isActive: Bool = false
    @State private var num = ""
    @State var score = 0
    
    var body: some View {
        if (isActive) {
            ScoreView(score: score)
        }
        else {
            VStack {
                Text(problemString)
                    .font(.title)
                TextField("Enter here...", text: $num)
                    .keyboardType(.numberPad)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .onChange(of: num) { newNum in
                        if (newNum == res) {
                            problemString = generateProblem()
                            score += 1
                            num = ""
                        }
                    }
            }
            .padding()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: t, repeats: false) { timer in
                    isActive = true
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(t: 1.0)
    }
}
