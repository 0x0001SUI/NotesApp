//
//  ContentView.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


struct ContentView: View {
    @EnvironmentObject private var store: Store
    
    @State private var selectedCategory: CategoryType = .default
    @State private var selectedNote: Note?

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            SidebarView(selection: $selectedCategory)
        } content: {
            NotesView(category: selectedCategory, selection: $selectedNote)
                #if os(iOS)
                .toolbar {
                    ToolbarItem {
                        NewNoteButton(store: store) { newNote in
                            selectedCategory = .recents
                            selectedNote = newNote
                        }
                    }
                }
                #endif
        } detail: {
            NoteView(note: selectedNote)
                #if os(iOS)
                .navigationBarTitleDisplayMode(.inline)
                #endif
        }
        // push a selected category binding ...
        .felicisBinding(\.selectedCategory, $selectedCategory)
        // .. and a selected note binding to the global key window environment.
        .felicisBinding(\.selectedNote, $selectedNote)
    }
     
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
}

