//
//  NoteEditor.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import TextView
import Dividers
#if os(iOS)
import KeyboardState
#endif



struct NoteEditor: View {
    @EnvironmentObject private var store: Store
    @ObservedObject var note: Note
                
    @FocusState private var isFocused: Bool
    
    #if os(iOS)
    @KeyboardState private var keyboardState
    #endif
    
    var body: some View {
        VStack(spacing: .zero) {
            TextView(text: note.textBinding)
                
                // keep track of the focus state (so you can hide the keyboard later)
                .focused($isFocused)
                
                // style the note editor (see extension lower)
                .textViewNoteEditorStyles()
            
            #if os(macOS)
            if let date = note.formattedModificationDate {
                HStack {
                    Spacer()
                    
                    Text("Last modified on \(date)")
                        .foregroundStyle(.secondary)
                        .font(.caption)
                }
                .padding(pockedPadding)
                .background(.bar)
                .divider(at: .top)
            }
            #endif
        }
        // ignore the bottom safe area
        .ignoresSafeArea(.container, edges: .bottom)

        // force redraw on note change.
        .id(note.uuid)

        // push note to the global key window environment
        .felicisObject(note)
        
        // update note when text changes
        .task(id: note.safeText, saveChanges)
    
        #if os(iOS)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                hideKeyboardButton
            }
        }
        #endif
    }
    
    private var pockedPadding: EdgeInsets {
        EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
    }
    
    #if os(iOS)
    private var isKeyboardHidden: Bool {
        keyboardState == .hidden
    }
    #endif
    
    #if os(iOS)
    /// A button to resign focus from the text view.
    ///
    /// The button is disabled and hidden if the keyboard is currently hidden.
    private var hideKeyboardButton: some View {
        Button {
            isFocused = false
        } label: {
            Label("Hide Keyboard", systemImage: "keyboard.chevron.compact.down")
        }
        .disabled(isKeyboardHidden)
        .opacity(isKeyboardHidden ? 0 : 1)
        .animation(.spring(), value: keyboardState)
    }
    #endif
    
    /// Updates the date the note was changed and saves the changes.
    @Sendable func saveChanges() async {
        store.perform(saveChanges: true) {
            note.modificationDate = .now
        }
    }
}


fileprivate extension View {
    func textViewNoteEditorStyles() -> some View {
        self
            .background()
            .lineSpacing(5)
            .textViewSpellCheckingDisabled()
            .textViewKeyboardDismissMode(.immediately)
            .textViewDataDetector([.data])
            .textViewFont(.system(textStyle: .body, weight: .regular, design: .default))
    }
}
