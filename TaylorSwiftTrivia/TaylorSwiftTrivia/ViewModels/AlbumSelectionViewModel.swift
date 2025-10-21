//
//  AlbumSelectionViewModel.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import Foundation

final class AlbumSelectionViewModel: ObservableObject {
    @Published var albums: [Album] = []
    
    init(albums: [Album] = AlbumData.albums) {
        self.albums = albums
    }
}
