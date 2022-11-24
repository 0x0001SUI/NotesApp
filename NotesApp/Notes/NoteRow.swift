//
//  NoteRow.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import ScaledValues
import PlatformSpecificValue


struct NoteRow: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    @ObservedObject var note: Note
    
    private var summary: String {
        note.safeText
    }
    
    private var creationDate: String? {
        if dynamicTypeSize.isAccessibilitySize {
            return note.accessibleFormattedCreationDate
        } else {
            return note.formattedCreationDate
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: spacing) {
                Text(summary)
                    .font(summaryFont)
                    .lineLimit(summaryLineLimit)
                
                if let creationDate = creationDate {
                    Text(creationDate)
                        .font(dateFont)
                        .foregroundStyle(.secondary)
                        .lineLimit(dateLineLimit)
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
        .padding(padding)
    }
    
    // Scalled summary (headline) font
    @ScaledFont(
        size: platformSpecific(.macOS(14), .iOS(19)),
        weight: .medium,
        leading: .tight,
        relativeTo: .headline
    ) private var summaryFont: Font
    
    // Scalled creation date font
    @ScaledFont(
        size: platformSpecific(.macOS(12), .iOS(15)),
        relativeTo: .subheadline
    ) private var dateFont: Font
    
    // Scalled line limit for summary
    @ScaledValue(min: 3, relativeTo: .headline)
    private var summaryLineLimit: Int = 3
    
    // Scalled line limit for creation date
    @ScaledValue(min: 1, relativeTo: .subheadline)
    private var dateLineLimit: Int = 1
    
    // Scalled spacing between summary and creation date
    @ScaledValue(relativeTo: .headline)
    private var spacing: Double = 6.5
    
    // Scalled padding around the row
    @ScaledValue(relativeTo: .headline)
    private var padding: Double = 5
}

