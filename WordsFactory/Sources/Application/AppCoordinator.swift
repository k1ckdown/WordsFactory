//
//  AppCoordinator.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import Notifications

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
            sceneView
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.light)
    }

    @ViewBuilder
    private var sceneView: some View {
        switch scene {
        case .auth:
            factory.makeAuthCoordinator {
                scene = .mainTabBar
                Task { await scheduleNotificationsAfterAuth() }
            }
        case .onBoarding:
            factory.makeOnBoardingCoordinator { scene = .auth }
        case .mainTabBar:
            factory.makeMainTabBarCoordinator()
                .onAppear {
                    TrainingNotificationManager.shared.scheduleForWeek(includeToday: false)
                }
        }
    }
}

// MARK: - Private methods

private extension AppCoordinator {
    
    func scheduleNotificationsAfterAuth() async {
        guard
            let isGranted = try? await LocalNotificationManager.shared.requestAuthorization(),
            isGranted
        else { return }

        TrainingNotificationManager.shared.scheduleForWeek(includeToday: true)
    }
}

#Preview {
    AppCoordinator(factory: .init())
}
