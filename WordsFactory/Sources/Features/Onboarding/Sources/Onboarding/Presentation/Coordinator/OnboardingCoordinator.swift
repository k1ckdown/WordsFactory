//
//  OnboardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import Foundation

protocol OnboardingCoordinatorProtocol: AnyObject {
    func finish()
}

final class OnboardingCoordinator: ObservableObject {

    private let flowFinishHandler: () -> Void

    init(flowFinishHandler: @escaping () -> Void) {
        self.flowFinishHandler = flowFinishHandler
    }
}

// MARK: - OnboardingCoordinatorProtocol

extension OnboardingCoordinator: OnboardingCoordinatorProtocol {

    func finish() {
        flowFinishHandler()
    }
}
