//
//  SongRankView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI
import CoreData

struct SongRankView: View {
    @Environment(\.managedObjectContext) private var context
    @FetchRequest var savedSongs: FetchedResults<RankedSong>
    
    let album: Album
    @State private var songs: [String] = []
    
    init(album: Album) {
        self.album = album
        _savedSongs = FetchRequest<RankedSong>(
            sortDescriptors: [NSSortDescriptor(keyPath: \RankedSong.position, ascending: true)],
            predicate: NSPredicate(format: "albumName == %@", album.title)
        )
    }
    
    var body: some View {
        VStack {
            Text("\(album.emoji) \(album.title)")
                .font(.largeTitle.bold())
                .padding(.top)
            
            Text("Drag to rank your favorite songs")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            List {
                ForEach(Array(songs.enumerated()), id: \.element) { index, song in
                    HStack(spacing: 12) {
                        rankIcon(for: index) // 🏅 emoji or number
                            .frame(width: 30, alignment: .trailing)
                        
                        Text(song)
                            .font(.body)
                            .lineLimit(2)
                        Spacer()
                    }
                    .padding(.vertical, 6)
                }
                .onMove(perform: moveSong)
            }
            .listStyle(.inset)
            .toolbar { EditButton() }
        }
        .onAppear(perform: loadSongs)
    }
    
    // MARK: - Rank Icon
    @ViewBuilder
    private func rankIcon(for index: Int) -> some View {
        switch index {
        case 0:
            Text("🥇")
                .font(.title3)
                .frame(width: 35, alignment: .trailing) // ⬅️ wider + right-aligned
                .offset(x: 3)
        case 1:
            Text("🥈")
                .font(.title3)
                .frame(width: 35, alignment: .trailing) // ⬅️ wider + right-aligned
                .offset(x: 3)
        case 2:
            Text("🥉")
                .font(.title3)
                .frame(width: 35, alignment: .trailing) // ⬅️ wider + right-aligned
                .offset(x: 3)
        default:
            Text("\(index + 1).")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
    }
    
    // MARK: - Load Songs
    private func loadSongs() {
        // Always start from current Core Data entries
        var currentTitles = savedSongs.compactMap { $0.songTitle }

        // Add any new songs that aren't in Core Data yet
        let newSongs = album.songs.filter { !currentTitles.contains($0) }

        if !newSongs.isEmpty {
            for newSong in newSongs {
                let ranked = RankedSong(context: context)
                ranked.id = UUID()
                ranked.albumName = album.title
                ranked.songTitle = newSong
                ranked.position = Int16(currentTitles.count)
                currentTitles.append(newSong)
            }
            try? context.save()
        }

        // Remove songs that no longer exist in album.songs
        let obsolete = savedSongs.filter { !album.songs.contains($0.songTitle ?? "") }
        for song in obsolete {
            context.delete(song)
        }
        try? context.save()

        // Sort and display
        songs = savedSongs
            .sorted(by: { $0.position < $1.position })
            .compactMap { $0.songTitle }
    }

    
    // MARK: - Move Songs
    private func moveSong(from source: IndexSet, to destination: Int) {
        withAnimation(.easeInOut) {
            songs.move(fromOffsets: source, toOffset: destination)
        }
        saveOrder()
    }
    
    // MARK: - Save Initial Order
    private func saveInitialOrder() {
        for (index, song) in songs.enumerated() {
            let ranked = RankedSong(context: context)
            ranked.id = UUID()
            ranked.albumName = album.title
            ranked.songTitle = song
            ranked.position = Int16(index)
        }
        try? context.save()
    }
    
    // MARK: - Save Updated Order
    private func saveOrder() {
        for (index, song) in songs.enumerated() {
            if let match = savedSongs.first(where: { $0.songTitle == song }) {
                match.position = Int16(index)
            }
        }
        try? context.save()
    }
}
