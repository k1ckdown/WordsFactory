//
//  QuestionCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import SwiftUI
import CommonUI

struct QuestionCoordinatorView<Content: View>: View {
    typealias Factory = TrainingFinishCoordinatorFactory

    private let factory: Factory
    private let content: () -> Content
    @ObservedObject private var coordinator: QuestionCoordinator

    init(factory: Factory, content: @autoclosure @escaping () -> Content, coordinator: QuestionCoordinator) {
        self.factory = factory
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        RouterView(selection: $coordinator.screen, content: {
            content()
                .appBackButton()
                .errorAlert($coordinator.errorMessage)
        }, destination: destination)
    }

    @ViewBuilder
    private func destination(_ screen: QuestionCoordinator.Screen) -> some View {
        switch (screen, coordinator.screen) {
        case (.trainingFinish, .trainingFinishParameterized(let answers)):
            factory.makeTrainingFinishCoordinator(answers: answers)
        default:
            EmptyView()
        }
    }
}
