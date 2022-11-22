//
//  FavoriteNotes.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import CoreData


struct FavoriteNotes: View {
    @FetchRequest(fetchRequest: .favorites)
    private var notes: FetchedResults<Note>
    
    @Binding var selection: Note?
    
    var body: some View {
        NotesList(notes: notes, selection: $selection)
            .navigationTitle("Favorites")
    }
}


fileprivate extension NSFetchRequest where ResultType == Note {
    static var favorites: NSFetchRequest<Note> {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.creationDate, ascending: true)]
        request.predicate = NSCompoundPredicate(type: .and, subpredicates: [
            NSPredicate(format: "isHidden == false"),
            NSPredicate(format: "isFavorite == true")
        ])
        return request
    }
}

