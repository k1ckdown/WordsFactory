//
//  TrainingStartCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import SwiftUI
import CommonUI

struct TrainingStartCoordinatorView<Content: View>: View {
    typealias Factory = QuestionCoordinatorFactory

    private let factory: Factory
    private let content: () -> Content
    @ObservedObject private var coordinator: TrainingStartCoordinator

    init(factory: Factory, content: @autoclosure @escaping () -> Content, coordinator: TrainingStartCoordinator) {
        self.factory = factory
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        RouterView(selection: $coordinator.screen, content: content, destination: destination)
    }

    @ViewBuilder
    private func destination(_ screen: TrainingStartCoordinator.Screen) -> some View {
        switch screen {
        case .question:
            factory.makeQuestionCoordinator()
        }
    }
}
