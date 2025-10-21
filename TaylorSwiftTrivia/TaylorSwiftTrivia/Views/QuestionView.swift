//
//  QuestionView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct QuestionView: View {
    let question: Question
    let onAnswer: (String) -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text(question.question)
                .font(.title2.bold())
                .multilineTextAlignment(.center)
                .padding()
            
            ForEach(question.options, id: \.self) { option in
                Button(action: { onAnswer(option) }) {
                    Text(option)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.8))
                        .cornerRadius(12)
                        .shadow(radius: 4)
                }
            }
        }
        .padding()
    }
}
