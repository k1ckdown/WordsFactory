//
//  LocalNotificationManager.swift
//
//
//  Created by Ivan Semenov on 10.04.2024.
//

import UIKit
import UserNotifications

public final class LocalNotificationManager {
    public static let shared = LocalNotificationManager()
    private let center = UNUserNotificationCenter.current()
}

// MARK: - Public methods

public extension LocalNotificationManager {

    func requestAuthorization() async throws -> Bool {
        let options: UNAuthorizationOptions = [.alert, .sound]
        return try await center.requestAuthorization(options: options)
    }
}
