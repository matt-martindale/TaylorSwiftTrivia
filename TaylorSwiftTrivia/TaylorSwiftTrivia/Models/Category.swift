//
//  Category.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let color: Color
    let emoji: String
    let type: CategoryType
}

enum CategoryType {
    case life, albumRed, album1989, albumFolklore, songRanker
}
