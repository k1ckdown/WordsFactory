//
//  OnBoardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI

public struct OnBoardingCoordinatorView: View {

    private let factory: ScreenFactory
    @ObservedObject private var coordinator: OnBoardingCoordinator

    init(factory: ScreenFactory, coordinator: OnBoardingCoordinator) {
        self.factory = factory
        self.coordinator = coordinator
    }

    public var body: some View {
        factory.makeOnBoardingScreen(coordinator: coordinator)
    }
}
