//
//  ContentView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var viewModel: TriviaViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink.opacity(0.3), .purple.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            if viewModel.showResult {
                ResultView(score: viewModel.score, total: viewModel.questions.count) {
                    viewModel.restart()
                }
            } else {
                QuestionView(
                    question: viewModel.questions[viewModel.currentIndex],
                    onAnswer: viewModel.selectAnswer
                )
            }
        }
        .animation(.easeInOut, value: viewModel.currentIndex)
    }
}

#Preview {
    ContentView(viewModel: TriviaViewModel.lifeTrivia())
}
