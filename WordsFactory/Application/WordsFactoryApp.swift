//
//  WordsFactoryApp.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 18.03.2024.
//

import SwiftUI

@main
struct WordsFactoryApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    private let appCoordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(
                factory: AppFactory(signOutHandler: {
                    Task { @MainActor in appCoordinator.showAuth() }
                }),
                coordinator: appCoordinator
            )
            .onAppear {
                appDelegate.appCoordinator = appCoordinator
            }
        }
    }
}
