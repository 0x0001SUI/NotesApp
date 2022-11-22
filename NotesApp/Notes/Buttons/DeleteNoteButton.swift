//
//  DeleteNoteButton.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


struct DeleteNoteButton: View {
    @FelicisBinding(\.selectedNote) private var selectedNote
    
    @ObservedObject var store: Store
    @ObservedObject var note: Note
    
    var body: some View {
        Button(role: .destructive) {
            if let unwrappedSelectedNote = selectedNote, unwrappedSelectedNote == note {
                self.selectedNote! = nil
            }
            
            store.deleteNote(note)
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
}
