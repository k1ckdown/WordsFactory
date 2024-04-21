//
//  SignInCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import SwiftUI

struct SignInCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: SignInCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: SignInCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
            .errorAlert($coordinator.errorMessage)
    }
}
