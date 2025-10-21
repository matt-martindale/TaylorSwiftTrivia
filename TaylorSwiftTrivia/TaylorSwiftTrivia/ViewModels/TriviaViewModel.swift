//
//  TriviaViewModel.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import Foundation

class TriviaViewModel: ObservableObject {
    @Published var questions: [Question]
    @Published var currentIndex = 0
    @Published var score = 0
    @Published var showResult = false
    
    init(questions: [Question]) {
        self.questions = questions
    }
    
    func selectAnswer(_ answer: String) {
        if answer == questions[currentIndex].correctAnswer {
            score += 1
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        if currentIndex + 1 < questions.count {
            currentIndex += 1
        } else {
            showResult = true
        }
    }
    
    func restart() {
        currentIndex = 0
        score = 0
        showResult = false
    }
}

// MARK: - Sample Trivia Categories
extension TriviaViewModel {
    static func lifeTrivia() -> TriviaViewModel {
        TriviaViewModel(questions: [
            Question(question: "What year was Taylor Swift born?", options: ["1989", "1990", "1988", "1991"], correctAnswer: "1989"),
            Question(question: "What’s Taylor’s middle name?", options: ["Alison", "Marie", "Elizabeth", "Nicole"], correctAnswer: "Alison"),
            Question(question: "Which city was she born in?", options: ["Nashville", "Reading", "Memphis", "Dallas"], correctAnswer: "Reading")
        ])
    }
    
    static func redTrivia() -> TriviaViewModel {
        TriviaViewModel(questions: [
            Question(question: "Which track features Ed Sheeran?", options: ["Everything Has Changed", "Red", "I Knew You Were Trouble", "22"], correctAnswer: "Everything Has Changed"),
            Question(question: "Which song was famously re-recorded as a 10-minute version?", options: ["All Too Well", "Treacherous", "The Last Time", "Sad Beautiful Tragic"], correctAnswer: "All Too Well")
        ])
    }
    
    static func trivia1989() -> TriviaViewModel {
        TriviaViewModel(questions: [
            Question(question: "What was the lead single from 1989?", options: ["Blank Space", "Shake It Off", "Style", "Welcome to New York"], correctAnswer: "Shake It Off")
        ])
    }
    
    static func folkloreTrivia() -> TriviaViewModel {
        TriviaViewModel(questions: [
            Question(question: "Which track opens the Folklore album?", options: ["Cardigan", "The 1", "August", "Exile"], correctAnswer: "The 1")
        ])
    }
}
