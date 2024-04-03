//
//  QuestionCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import SwiftUI
import CommonUI

struct QuestionCoordinatorView<Content: View>: View {
    typealias Factory = CoordinatorFactory

    private let factory: Factory
    private let content: () -> Content
    @ObservedObject private var coordinator: QuestionCoordinator

    init(factory: Factory, content: @autoclosure @escaping () -> Content, coordinator: QuestionCoordinator) {
        self.factory = factory
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
            .errorAlert($coordinator.errorMessage)
    }
}
