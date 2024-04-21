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
    }

    @ViewBuilder
    private var rootView: some View {
        switch coordinator.scene {
        case .auth:
            factory.makeAuthCoordinator(flowFinishHandler: coordinator.finishAuth)
        case .onBoarding:
            factory.makeOnBoardingCoordinator(flowFinishHandler: coordinator.finishOnBoarding)
        case .mainTabBar:
            factory.makeMainTabBarCoordinator().onAppear(perform: coordinator.onAppearMainTabBar)
        }
    }
}
