//
//  OnBoardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI

struct OnBoardingCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: OnBoardingCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: OnBoardingCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
    }
}
