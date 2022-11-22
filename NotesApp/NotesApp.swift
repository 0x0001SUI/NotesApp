//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI


@main
struct NotesApp: App {
    @StateObject private var store = Store()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .felicisObject(store)
                .environmentObject(store)
                .environment(\.managedObjectContext, store.context)
        }
        .commands {
            AddCommands()
            NoteCommands()
            SidebarCategoryCommands()
        }
    }
}
