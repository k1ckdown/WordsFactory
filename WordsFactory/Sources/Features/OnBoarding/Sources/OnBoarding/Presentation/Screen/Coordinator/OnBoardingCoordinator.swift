//
//  OnBoardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import Foundation

protocol OnBoardingCoordinatorProtocol: AnyObject {
    func finish()
}

final class OnBoardingCoordinator: ObservableObject {

    private let flowFinishHandler: () -> Void

    init(flowFinishHandler: @escaping () -> Void) {
        self.flowFinishHandler = flowFinishHandler
    }
}

// MARK: - OnBoardingCoordinatorProtocol

extension OnBoardingCoordinator: OnBoardingCoordinatorProtocol {

    func finish() {
        flowFinishHandler()
    }
}
