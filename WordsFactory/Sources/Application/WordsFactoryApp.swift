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

    var body: some Scene {
        WindowGroup {
            AppCoordinator(factory: AppFactory())
        }
    }
}
