//
//  AppDelegate.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 09.04.2024.
//

import UIKit
import AppGroup
import FirebaseAuth
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        configureFirebase()
        UNUserNotificationCenter.current().delegate = self

        return true
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification
    ) async -> UNNotificationPresentationOptions {
        .banner
    }
}

// MARK: - Configure

extension AppDelegate {

    func configureFirebase() {
        FirebaseApp.configure()
        Auth.auth().shareAuthStateAcrossDevices = true
        try? Auth.auth().useUserAccessGroup(AppGroup.Constants.appGroupId)
    }
}
