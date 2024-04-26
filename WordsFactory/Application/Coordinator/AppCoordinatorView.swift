//
//  AppCoordinatorView.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

struct AppCoordinatorView: View {

    private let factory: AppFactory
    @StateObject private var coordinator: AppCoordinator

    init(factory: AppFactory, coordinator: AppCoordinator) {
        self.factory = factory
        _coordinator = StateObject(wrappedValue: coordinator)
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
            factory.makeAuthCoordinator(flowFinishHandler: coordinator.showMainTabBar)
        case .onboarding:
            factory.makeOnboardingCoordinator(flowFinishHandler: coordinator.showMainTabBar)
        case .mainTabBar:
            factory.makeMainTabBarCoordinator().didLoad(perform: coordinator.mainTabBarDidLoad)
        }
    }
}
