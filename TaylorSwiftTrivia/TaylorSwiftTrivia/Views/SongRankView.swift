//
//  SongRankView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct SongRankView: View {
    @State private var songs = [
        "All Too Well (10 Minute Version)",
        "Cruel Summer",
        "Style",
        "Love Story",
        "August"
    ]
    
    var body: some View {
        VStack {
            Text("🎶 Rank Your Favorites")
                .font(.largeTitle.bold())
                .padding(.top)
            
            Text("Drag to reorder Taylor’s hits")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            List {
                ForEach(Array(songs.enumerated()), id: \.element) { index, song in
                    HStack(spacing: 12) {
                        // Rank number on the left
                        Text("\(index + 1).")
                            .font(.headline)
                            .frame(width: 30, alignment: .trailing)
                            .foregroundStyle(.secondary)
                        
                        Text(song)
                            .font(.body)
                            .lineLimit(2)
                        
                        Spacer()
                    }
                    .padding(.vertical, 6)
                }
                .onMove { indices, newOffset in
                    songs.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .listStyle(.inset)
            .toolbar {
                EditButton()
            }
        }
    }
}
