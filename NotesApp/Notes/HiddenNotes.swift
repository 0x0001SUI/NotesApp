//
//  HiddenNotes.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import CoreData


struct HiddenNotes: View {
    @FetchRequest(fetchRequest: .hidden)
    private var notes: FetchedResults<Note>
    
    @Binding var selection: Note?
    
    var body: some View {
        NotesList(notes: notes, selection: $selection)
            .navigationTitle("Hidden")
    }
}


fileprivate extension NSFetchRequest where ResultType == Note {
    static var hidden: NSFetchRequest<Note> {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Note.creationDate, ascending: true)]
        request.predicate = NSPredicate(format: "isHidden == true")
        return request
    }
}
