//
//  SidebarCategoryCommands.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


struct SidebarCategoryCommands: Commands {
    #if os(macOS)
    @FelicisBinding(\.selectedCategory) private var selectedCategory: Category?
    #else
    @FelicisBinding(\.selectedCategory) private var selectedCategory: Category?!
    #endif
    
    var body: some Commands {
        CommandGroup(after: .sidebar) {
            Section("Category") {
                Button {
                    self.selectedCategory = .recents
                } label: {
                    Label("Recents", systemImage: "clock")
                }
                .keyboardShortcut("1", modifiers: .command)
                
                Button {
                    self.selectedCategory = .favorites
                } label: {
                    Label("Favorites", systemImage: "heart")
                }
                .keyboardShortcut("2", modifiers: .command)
                
                Button {
                    self.selectedCategory = .hidden
                } label: {
                    Label("Hidden", systemImage: "eye.slash")
                }
                .keyboardShortcut("3", modifiers: .command)
            }
            .labelStyle(.titleAndIcon)
            .disabled(selectedCategory == nil)
        }
    }
}
