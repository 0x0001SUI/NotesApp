//
//  SelectedNoteBindingFelicisKey.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


private struct SelectedNoteBindingFelicisKey: FelicisKey {
    typealias Value = Binding<Note?>
}


extension FelicisValues {
    /// A selected note in the key window.
    var selectedNote: Binding<Note?>? {
        get { self[SelectedNoteBindingFelicisKey.self] }
        set { self[SelectedNoteBindingFelicisKey.self] = newValue }
    }
}
