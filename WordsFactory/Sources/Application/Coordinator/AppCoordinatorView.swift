//
//  AppCoordinatorView.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

struct AppCoordinatorView: View {

    @ObservedObject private var coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    var body: some View {
        NavigationView {
            coordinator.view
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.light)
    }
}

#Preview {
    AppCoordinatorView(coordinator: .init())
}
