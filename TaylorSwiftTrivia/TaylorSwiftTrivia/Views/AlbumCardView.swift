//
//  AlbumCardView.swift
//  TaylorSwiftTrivia
//
//  Created by Matt Martindale on 10/21/25.
//

import SwiftUI

struct AlbumCardView: View {
    let album: Album
    
    var body: some View {
        VStack(spacing: 8) {
            if let imageName = album.imageName,
               let uiImage = UIImage(named: imageName) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: 140, height: 140)
                    .cornerRadius(16)
                    .shadow(radius: 4)
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(album.color.opacity(0.2))
                        .frame(width: 140, height: 140)
                    Text(album.emoji)
                        .font(.system(size: 50))
                }
            }
            
            Text(album.title)
                .font(.headline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.primary)
                .frame(width: 140)
        }
    }
}
