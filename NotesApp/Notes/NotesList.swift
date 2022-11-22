//
//  NotesList.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI

struct NotesList<Notes>: View where Notes : RandomAccessCollection, Notes.Element == Note {    
    @EnvironmentObject private var store: Store
    
    var notes: Notes
    @Binding var selection: Note?
    
    var body: some View {
        List(selection: $selection) {
            ForEach(notes) { note in
                row(note)
                    .tag(note)
            }
        }
        .overlay(content: placeholder)
        #if os(macOS)
        .navigationSubtitle("\(notes.count) notes")
        #endif
    }
    
    private func row(_ note: Note) -> some View {
        NoteRow(note: note)
            .contextMenu {
                Section {
                    FavoriteNoteButton(store: store, note: note)
                    HideNoteButton(store: store, note: note)
                }
                
                Section {
                    DeleteNoteButton(store: store, note: note)
                }
            }
    }
    
    @ViewBuilder private func placeholder() -> some View {
        if notes.isEmpty {
            Text("No Notes")
                .font(.title2)
                .foregroundStyle(.tertiary)
        }
    }
}
