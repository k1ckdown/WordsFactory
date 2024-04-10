//
//  LocalNotificationManager.swift
//
//
//  Created by Ivan Semenov on 10.04.2024.
//

import UserNotifications

public final class LocalNotificationManager: NSObject {

    public static let shared = LocalNotificationManager()
    private let center = UNUserNotificationCenter.current()

    private override init() {
        super.init()
        center.delegate = self
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension LocalNotificationManager: UNUserNotificationCenterDelegate {

    public func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        .banner
    }
}

// MARK: - Public methods

public extension LocalNotificationManager {

    func requestAuthorization() async throws -> Bool {
        let options: UNAuthorizationOptions = [.alert, .sound]
        return try await center.requestAuthorization(options: options)
    }
}
