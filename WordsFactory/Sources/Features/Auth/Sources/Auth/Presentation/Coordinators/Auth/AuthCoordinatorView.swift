//
//  AuthCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI

struct AuthCoordinatorView: View {

    @StateObject private var coordinator: AuthCoordinator

    init(coordinator: AuthCoordinator) {
        _coordinator = StateObject(wrappedValue: coordinator)
    }

    var body: some View {
        coordinator.rootView
    }
}
