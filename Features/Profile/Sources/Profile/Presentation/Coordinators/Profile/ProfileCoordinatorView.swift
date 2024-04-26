//
//  ProfileCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import SwiftUI
import CommonUI

struct ProfileCoordinatorView<Content: View>: View {
    typealias Factory = PersonalInfoCoordinatorFactory

    private let factory: Factory
    private let content: () -> Content
    @ObservedObject private var coordinator: ProfileCoordinator

    init(factory: Factory, content: @autoclosure @escaping () -> Content, coordinator: ProfileCoordinator) {
        self.factory = factory
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        RouterView(selection: $coordinator.screen, content: content, destination: destination)
            .errorAlert($coordinator.errorMessage)
    }

    @ViewBuilder
    private func destination(_ screen: ProfileCoordinator.Screen) -> some View {
        switch (screen, coordinator.screen) {
        case (.personalInfo, .personalInfoParameterized(let user)):
            factory.makePersonalInfoCoordinator(user: user)
        default:
            EmptyView()
        }
    }
}
