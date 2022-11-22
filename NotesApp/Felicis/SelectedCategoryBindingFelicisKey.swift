//
//  SelectedCategoryBindingFelicisKey.swift
//  NotesApp
//
//  Created by Dima Koskin on 17.11.2022.
//

import SwiftUI
import FelixFelicis


private struct SelectedCategoryBindingFelicisKey: FelicisKey {
    typealias Value = Binding<CategoryType>
}


extension FelicisValues {
    /// A selected sideabar category in the key window.
    var selectedCategory: Binding<CategoryType>? {
        get { self[SelectedCategoryBindingFelicisKey.self] }
        set { self[SelectedCategoryBindingFelicisKey.self] = newValue }
    }
}
