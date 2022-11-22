//
//  RecentNotes.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import CoreData


struct RecentNotes: View {
    @FetchRequest(fetchRequest: .recents)
    private var notes: FetchedResults<Note>
    
    @Binding var selection: Note?
    
    var body: some View {
        NotesList(notes: notes, selection: $selection)
            .navigationTitle("Recents")
    }
}


fileprivate extension NSFetchRequest where ResultType == Note {
    static var recents: NSFetchRequest<Note> {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.creationDate, ascending: false)]
        return request
    }
}
