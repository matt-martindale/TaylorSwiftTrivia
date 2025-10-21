//
//  Album.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct Album: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let emoji: String
    let imageName: String?
    let songs: [String]
}
