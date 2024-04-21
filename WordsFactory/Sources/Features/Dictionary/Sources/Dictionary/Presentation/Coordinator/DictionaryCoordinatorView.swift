//
//  DictionaryCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

struct DictionaryCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: DictionaryCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: DictionaryCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
            .errorAlert($coordinator.errorMessage)
            .navigationBarHidden(true)
    }
}
