//
//  AppCoordinator.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 13.04.2024.
//

import SwiftUI
import WidgetKit
import Notifications

final class AppCoordinator: ObservableObject {

    enum Scene {
        case idle
        case auth
        case onboarding
        case mainTabBar
    }

    @Published private(set) var scene = Scene.idle
    @AppStorage(AppSettings.showOnboarding.key) var showOnboarding = true
}

// MARK: - Public methods

extension AppCoordinator {

    func onAppear() {
        scene = showOnboarding ? .onboarding : .auth
    }

    func finishOnboarding() {
        scene = .auth
        showOnboarding = false
    }

    func finishAuth() {
        scene = .mainTabBar
        WidgetCenter.shared.reloadAllTimelines()
    }

    func mainTabBarDidLoad() {
        Task { await scheduleNotifications() }
    }
}

// MARK: - Private methods

private extension AppCoordinator {

    @MainActor
    func scheduleNotifications() async {
        guard
            let isGranted = try? await LocalNotificationManager.shared.requestAuthorization(),
            isGranted
        else { return }

        await TrainingNotificationManager.shared.scheduleForWeek()
    }
}