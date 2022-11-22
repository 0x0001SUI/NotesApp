//
//  AddCommands.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


struct AddCommands: Commands {
    @FelicisObject private var store: Store?
    @FelicisBinding(\.selectedNote) private var selectedNote
    @FelicisBinding(\.selectedCategory) private var selectedCategory
    
    var body: some Commands {
        if let store = store {
            CommandGroup(after: .newItem) {
                NewNoteButton(store: store) { newNote in
                    self.selectedCategory = .recents
                    self.selectedNote = newNote
                }
                .keyboardShortcut("n", modifiers: [.command, .shift])
            }
        } else {
            EmptyCommands()
        }
    }
}
