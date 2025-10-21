//
//  ResultView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct ResultView: View {
    let score: Int
    let total: Int
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("🎤 You Scored \(score)/\(total)!")
                .font(.largeTitle.bold())
            
            if score == total {
                Text("Flawless victory, Swiftie Supreme! 💅")
                    .font(.headline)
            } else {
                Text("You’ll do better next era 💔")
                    .font(.headline)
            }
            
            Button("Play Again", action: onRestart)
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                .padding(.top)
        }
        .padding()
    }
}
