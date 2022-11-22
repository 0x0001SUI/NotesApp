//
//  HideNoteButton.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI


struct HideNoteButton: View {
    @ObservedObject var store: Store
    @ObservedObject var note: Note
    
    var body: some View {
        Button {
            store.perform(saveChanges: true) {
                note.isHidden.toggle()
            }
        } label: {
            if note.isHidden {
                Label("Unhide", systemImage: "eye.slash.fill")
            } else {
                Label("Hide", systemImage: "eye.slash")
            }
        }
    }
}
