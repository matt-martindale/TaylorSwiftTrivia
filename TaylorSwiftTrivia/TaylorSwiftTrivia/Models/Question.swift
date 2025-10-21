//
//  Question.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
}
