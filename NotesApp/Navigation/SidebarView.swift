//
//  SidebarView.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import ScaledValues


#if os(macOS)
typealias CategoryType = Category
#else
typealias CategoryType = Category?
#endif


struct SidebarView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    @Binding var selection: CategoryType
        
    var body: some View {
        List(selection: $selection) {
            Section {
                NavigationLink(value: Category.recents) {
                    rowLabel("Recents", systemImage: "clock")
                }
                
                NavigationLink(value: Category.favorites) {
                    rowLabel("Favorites", systemImage: "heart")
                }
                
                NavigationLink(value: Category.hidden) {
                    rowLabel("Hidden", systemImage: "eye.slash")
                }
            }
            .headerProminence(.increased)
            #if os(iOS)
            .listRowInsets(rowInsets)
            #endif
        }
        #if os(iOS)
        .listStyle(.insetGrouped)
        .navigationTitle("Notes")
        #endif
    }
    
    private func rowLabel(_ title: LocalizedStringKey, systemImage: String) -> some View {
        ViewThatFits {
            Label(title, systemImage: systemImage)
            Text(title)
        }
        .lineLimit(1)
        #if os(iOS)
        .padding(rowPadding)
        #endif
    }
    
    #if os(iOS)
    @ScaledInsets private var rowInsets = EdgeInsets(top: 6.5, leading: 15, bottom: 6.5, trailing: 15)
    @ScaledInsets private var rowPadding = EdgeInsets(top: 6.5, leading: 0, bottom: 6.5, trailing: 0)
    #endif
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
