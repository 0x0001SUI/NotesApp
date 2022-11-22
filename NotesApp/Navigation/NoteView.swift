//
//  NoteView.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI


struct NoteView: View {
    var note: Note?
    
    var body: some View {
        if let note = note {
            NoteEditor(note: note)
        } else {
            placeholder
        }
    }
    
    private var placeholder: some View {
        GeometryReader { geometry in
            ZStack {
                Text("Select a Note")
                    .foregroundStyle(.tertiary)
                    .font(.title2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background()
        }
    }
}
