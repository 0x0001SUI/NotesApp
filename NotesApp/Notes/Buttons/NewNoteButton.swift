//
//  NewNoteButton.swift
//  NotesApp
//
//  Created by Dima Koskin on 20.11.2022.
//

import SwiftUI


struct NewNoteButton: View {
    @ObservedObject var store: Store
    var action: (Note) -> Void
    
    var body: some View {
        Button {
            action(store.createNote())
        } label: {
            Label("Add Note", systemImage: "plus")
        }
    }
}
