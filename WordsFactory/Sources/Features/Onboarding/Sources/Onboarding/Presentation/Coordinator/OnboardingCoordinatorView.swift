//
//  OnboardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI

struct OnboardingCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: OnboardingCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: OnboardingCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
    }
}
