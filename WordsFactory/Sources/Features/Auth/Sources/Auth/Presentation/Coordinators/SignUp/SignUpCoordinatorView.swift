//
//  SignUpCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import SwiftUI

struct SignUpCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: SignUpCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: SignUpCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
            .errorAlert($coordinator.errorMessage)
    }
}
