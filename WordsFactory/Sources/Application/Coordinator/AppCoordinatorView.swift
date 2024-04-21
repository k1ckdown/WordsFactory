//
//  AppCoordinatorView.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

struct AppCoordinatorView: View {

    private let factory = AppFactory()
    @ObservedObject private var coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationView {
            rootView
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.light)
        .onAppear(perform: coordinator.onAppear)
    }

    @ViewBuilder
    private var rootView: some View {
        switch coordinator.scene {
        case .idle:
            EmptyView()
        case .auth:
            factory.makeAuthCoordinator(flowFinishHandler: coordinator.finishAuth)
        case .onboarding:
            factory.makeOnBoardingCoordinator(flowFinishHandler: coordinator.finishOnBoarding)
        case .mainTabBar:
            factory.makeMainTabBarCoordinator().onAppear(perform: coordinator.onAppearMainTabBar)
        }
    }
}
