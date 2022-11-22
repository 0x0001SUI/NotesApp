//
//  NotesView.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI

struct NotesView: View {
    var category: Category?
    @Binding var selection: Note?
    
    var body: some View {
        if let category = category {
            switch category {
            case .recents:
                RecentNotes(selection: $selection)
            case .favorites:
                FavoriteNotes(selection: $selection)
            case .hidden:
                HiddenNotes(selection: $selection)
            }
        } else {
            placeholder
        }
    }
    
    private var placeholder: some View {
        GeometryReader { geometry in
            ZStack {
                Text("Select a Category")
                    .foregroundStyle(.tertiary)
                    .font(.title2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background()
        }
    }
}
