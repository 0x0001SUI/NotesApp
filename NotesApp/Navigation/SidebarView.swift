//
//  SidebarView.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI


#if os(macOS)
typealias CategoryType = Category
#else
typealias CategoryType = Category?
#endif


struct SidebarView: View {
    @Binding var selection: CategoryType
    
    var body: some View {
        List(selection: $selection) {
            Section("Library") {
                NavigationLink(value: Category.recents) {
                    Label("Recents", systemImage: "clock")
                }
                
                NavigationLink(value: Category.favorites) {
                    Label("Favorites", systemImage: "heart")
                }
                
                NavigationLink(value: Category.hidden) {
                    Label("Hidden", systemImage: "eye.slash")
                }
            }
            .headerProminence(.increased)
        }
        .navigationTitle("Notes")
    }
}



@frozen enum Category {
    case recents
    case favorites
    case hidden
    
    #if os(macOS)
    static let `default`: Category = .recents
    #else
    static let `default`: Category? = nil
    #endif
}
