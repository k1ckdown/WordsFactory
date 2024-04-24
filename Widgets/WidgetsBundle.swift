//
//  WidgetsBundle.swift
//  Widgets
//
//  Created by Ivan Semenov on 08.04.2024.
//

import SwiftUI
import WidgetKit
import AppGroup
import FirebaseAuth
import FirebaseCore

@main
struct WidgetsBundle: WidgetBundle {

    init() {
        configureFirebase()
    }

    var body: some Widget {
        DictionaryWordWidget()
        DictionaryOverviewWidget()
    }

    func configureFirebase() {
        FirebaseApp.configure()
        Auth.auth().shareAuthStateAcrossDevices = true
        try? Auth.auth().useUserAccessGroup(AppGroup.Constants.appGroupId)
    }
}
