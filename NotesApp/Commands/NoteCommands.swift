//
//  NoteCommands.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


struct NoteCommands: Commands {
    @FelicisObject private var store: Store?
    @FelicisObject private var note: Note?
    
    var body: some Commands {
        if let note = note, let store = store {
            CommandMenu("Note") {
                if let note = note {
                    Section {
                        FavoriteNoteButton(store: store, note: note)
                            .keyboardShortcut("f", modifiers: [.option])
                        HideNoteButton(store: store, note: note)
                            .keyboardShortcut("h", modifiers: [.option])
                    }
                    
                    Section {
                        DeleteNoteButton(store: store, note: note)
                    }
                }
            }
        } else {
            EmptyCommands()
        }
    }
}
