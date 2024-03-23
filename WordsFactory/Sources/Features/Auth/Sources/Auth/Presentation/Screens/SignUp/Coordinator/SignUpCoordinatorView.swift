//
//  SignUpCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import SwiftUI

struct SignUpCoordinatorView: View {
    
    private let screenFactory: ScreenFactory
    @ObservedObject private var coordinator: SignUpCoordinator
    
    init(coordinator: SignUpCoordinator, screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
        self.coordinator = coordinator
    }
    
    var body: some View {
        screenFactory.makeSignUp(coordinator: coordinator)
            .errorAlert($coordinator.errorMessage)
    }
}
