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

    private let isSignedIn: Bool
    @Published private(set) var scene = Scene.idle

    @AppStorage(AppSettings.showOnboarding.key)
    private var showOnboarding = true

    init(isSignedIn: Bool) {
        self.isSignedIn = isSignedIn
    }
}

// MARK: - Public methods

extension AppCoordinator {

    func onAppear() {
        scene = if isSignedIn { .mainTabBar } else { showOnboarding ? .onboarding : .auth }
    }

    func mainTabBarDidLoad() {
        Task { await scheduleNotifications() }
    }

    func showMainTabBar() {
        scene = .mainTabBar
        WidgetCenter.shared.reloadAllTimelines()
    }

    func showAuth() {
        switch scene {
        case .onboarding: showOnboarding = false
        case .mainTabBar: WidgetCenter.shared.reloadAllTimelines()
        default: break
        }

        scene = .auth
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
