//
//  Note.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import CoreData
import SwiftUI


extension Note {
    var safeText: String {
        text ?? ""
    }
    
    var textBinding: Binding<String> {
        Binding {
            self.safeText
        } set: {
            self.text = $0
        }
    }
    
    var formattedCreationDate: String? {
        self.creationDate?.formatted(date: .abbreviated, time: .shortened)
    }
}


extension Note: Comparable {
    public static func == (lhs: Note, rhs: Note) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    public static func < (lhs: Note, rhs: Note) -> Bool {
        (lhs.creationDate ?? .distantPast) < (rhs.creationDate ?? .distantPast)
    }
}


