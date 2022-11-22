//
//  NoteRow.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI


struct NoteRow: View {
    @ObservedObject var note: Note
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2.5) {
                Text(note.safeText)
                    .font(.body.weight(.medium))
                    .lineLimit(3)
                
                if let creationDate = note.formattedCreationDate {
                    Text(creationDate)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            Group {
                if note.isHidden {
                    Image(systemName: "eye.slash.fill")
                        .foregroundStyle(.mint)
                }
                
                if note.isFavorite {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.pink)
                }
            }
            .imageScale(.small)
        }
        .padding(5)
    }
}

