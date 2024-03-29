//
//  DictionaryCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

public struct DictionaryCoordinatorView: View {
    typealias Factory = DictionaryScreenFactory

    private let factory: Factory
    @ObservedObject private var coordinator: DictionaryCoordinator

    init(factory: Factory, coordinator: DictionaryCoordinator) {
        self.factory = factory
        self.coordinator = coordinator
    }

    public var body: some View {
        factory.makeDictionaryScreen(coordinator: coordinator)
            .errorAlert($coordinator.errorMessage)
    }
}
