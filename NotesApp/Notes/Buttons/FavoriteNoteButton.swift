//
//  FavoriteNoteButton.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI


struct FavoriteNoteButton: View {
    @ObservedObject var store: Store
    @ObservedObject var note: Note
    
    var body: some View {
        Button {
            store.perform(saveChanges: true) {
                note.isFavorite.toggle()
            }
        } label: {
            if note.isFavorite {
                Label("Unfavorite", systemImage: "heart.fill")
            } else {
                Label("Favorite", systemImage: "heart")
            }
        }
    }
}
