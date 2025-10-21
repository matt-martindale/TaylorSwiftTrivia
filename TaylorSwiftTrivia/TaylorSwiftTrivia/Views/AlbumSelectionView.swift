//
//  AlbumSelectionView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct AlbumSelectionView: View {
    @StateObject private var viewModel = AlbumSelectionViewModel()
    
    private let gridLayout = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 20) {
                ForEach(viewModel.albums) { album in
                    NavigationLink(destination: SongRankView(album: album)) {
                        AlbumCardView(album: album)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Select an Album")
    }
}
