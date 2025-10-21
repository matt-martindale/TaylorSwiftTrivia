//
//  HomeCardView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct HomeView: View {
    let categories: [Category] = [
        Category(title: "Taylor’s Life", subtitle: "General trivia about Taylor", color: .pink, emoji: "🎤", type: .life),
        Category(title: "Red", subtitle: "Test your Red era knowledge", color: .red, emoji: "❤️", type: .albumRed),
        Category(title: "1989", subtitle: "Relive the pop perfection", color: .blue, emoji: "💿", type: .album1989),
        Category(title: "Folklore", subtitle: "Ethereal and lyrical", color: .gray, emoji: "🌲", type: .albumFolklore),
        Category(title: "Song Ranker", subtitle: "Rank Taylor’s songs", color: .purple, emoji: "🎶", type: .songRanker)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 20)], spacing: 20) {
                    ForEach(categories) { category in
                        NavigationLink(destination: destination(for: category.type)) {
                            VStack(spacing: 10) {
                                Text(category.emoji)
                                    .font(.system(size: 50))
                                Text(category.title)
                                    .font(.title3.bold())
                                Text(category.subtitle)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity, minHeight: 150)
                            .background(category.color.opacity(0.2))
                            .cornerRadius(20)
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("SwiftTrivia+")
        }
    }
    
    @ViewBuilder
    func destination(for type: CategoryType) -> some View {
        switch type {
        case .life:
            ContentView(viewModel: TriviaViewModel.lifeTrivia())
        case .albumRed:
            ContentView(viewModel: TriviaViewModel.redTrivia())
        case .album1989:
            ContentView(viewModel: TriviaViewModel.trivia1989())
        case .albumFolklore:
            ContentView(viewModel: TriviaViewModel.folkloreTrivia())
        case .songRanker:
            AlbumSelectionView() // ✅ new entry point
        }
    }
}
