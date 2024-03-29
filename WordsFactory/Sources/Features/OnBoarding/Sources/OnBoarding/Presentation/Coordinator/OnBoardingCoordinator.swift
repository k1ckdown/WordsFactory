//
//  OnBoardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import Foundation

protocol OnBoardingCoordinatorProtocol {
    func finish()
}

final class OnBoardingCoordinator: ObservableObject {

    private let onFlowFinish: () -> Void

    init(onFlowFinish: @escaping () -> Void) {
        self.onFlowFinish = onFlowFinish
    }
}

// MARK: - OnBoardingCoordinatorProtocol

extension OnBoardingCoordinator: OnBoardingCoordinatorProtocol {

    func finish() {
        onFlowFinish()
    }
}
