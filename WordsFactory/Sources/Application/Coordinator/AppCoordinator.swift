//
//  AppCoordinator.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 13.04.2024.
//

import Foundation
import Notifications

final class AppCoordinator: ObservableObject {

    enum Scene {
        case auth
        case onBoarding
        case mainTabBar
    }

    @Published private(set) var scene = Scene.onBoarding
}

// MARK: - Public methods

extension AppCoordinator {

    func finishOnBoarding() {
        scene = .auth
    }

    func finishAuth() {
        scene = .mainTabBar
        Task { await self.scheduleNotificationsAfterAuth() }
    }

    func onAppearMainTabBar() {
        TrainingNotificationManager.shared.scheduleForWeek(includeToday: false)
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
