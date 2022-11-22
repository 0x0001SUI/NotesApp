//
//  Store.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import CoreData


class Store: ObservableObject, Identifiable {
    let id: UUID = UUID()
    
    private let persistence: PersistenceController = .shared
    
    public var context: NSManagedObjectContext {
        persistence.container.viewContext
    }
    
    public func perform(saveChanges: Bool, action: @escaping () -> Void) {
        self.context.perform {
            action()
            
            if saveChanges, self.context.hasChanges {
                try? self.context.save()
            }
        }
    }
    
    public func createNote() -> Note {
        let note = Note(context: context)
        
        self.perform(saveChanges: true) {
            note.uuid = UUID()
            note.creationDate = .now
            note.isFavorite = false
            note.isHidden = false
        }
        
        return note
    }
    
    public func deleteNote(_ note: Note) {
        self.perform(saveChanges: true) {
            self.context.delete(note)
        }
    }
}
