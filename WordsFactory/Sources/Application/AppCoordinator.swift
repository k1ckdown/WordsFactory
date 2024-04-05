//
//  AppCoordinator.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

struct AppCoordinator: View {

    private enum Scene {
        case auth
        case onBoarding
        case mainTabBar
    }

    private let factory: AppFactory
    @State private var scene = Scene.mainTabBar
    
    init(factory: AppFactory) {
        self.factory = factory
    }

    var body: some View {
        NavigationView {
            sceneCoordinator
        }
        .preferredColorScheme(.light)
    }

    @ViewBuilder
    private var sceneCoordinator: some View {
        switch scene {
        case .auth:
            factory.makeAuthCoordinator { scene = .mainTabBar }
        case .onBoarding:
            factory.makeOnBoardingCoordinator { scene = .auth }
        case .mainTabBar:
            factory.makeTrainingCoordinatorAssembly().assemble()
        }
    }
}

#Preview {
    AppCoordinator(factory: .init())
}
