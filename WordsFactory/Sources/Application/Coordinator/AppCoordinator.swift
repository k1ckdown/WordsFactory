//
//  AppCoordinator.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 13.04.2024.
//

import SwiftUI
import Foundation
import Notifications

final class AppCoordinator: ObservableObject {

    private enum Scene {
        case auth
        case onBoarding
        case mainTabBar
    }

    private let factory = AppFactory()
    @Published private var scene = Scene.onBoarding

    @ViewBuilder
    var view: some View {
        switch scene {
        case .auth:
            authCoordinator()
        case .onBoarding:
            onBoardingCoordinator()
        case .mainTabBar:
            mainTabBarCoordinator()
        }
    }
}

// MARK: - Scene Coordinators

private extension AppCoordinator {

    func onBoardingCoordinator() -> some View {
        factory.makeOnBoardingCoordinator { [weak self] in
            self?.scene = .auth
        }
    }

    func mainTabBarCoordinator() -> some View {
        factory.makeMainTabBarCoordinator()
            .onAppear {
                TrainingNotificationManager.shared.scheduleForWeek(includeToday: false)
            }
    }

    func authCoordinator() -> some View {
        factory.makeAuthCoordinator { [weak self] in
            guard let self else { return }

            scene = .mainTabBar
            Task { await self.scheduleNotificationsAfterAuth() }
        }
    }
}

// MARK: - Private methods

private extension AppCoordinator {

    @MainActor
    func scheduleNotificationsAfterAuth() async {
        guard
            let isGranted = try? await LocalNotificationManager.shared.requestAuthorization(),
            isGranted
        else { return }

        TrainingNotificationManager.shared.scheduleForWeek(includeToday: true)
    }
}
