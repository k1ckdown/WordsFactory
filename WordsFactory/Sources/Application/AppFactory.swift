//
//  AppFactory.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import Networking
import Auth
import OnBoarding
import Dictionary

final class AppFactory {
    private lazy var networkService = NetworkService()
}

// MARK: - Coordinators

extension AppFactory {

    func makeOnBoardingCoordinator() -> OnBoardingCoordinator {
        OnBoardingCoordinator()
    }

    func makeAuthCoordinator(onFlowFinish: @escaping () -> Void) -> AuthCoordinatorView {
        AuthCoordinatorAssembly.assemble(onFlowFinish: onFlowFinish)
    }

    func makeDictionaryViewAssembly() -> DictionaryViewAssembly {
        let dependencies = ModuleDependencies(networkService: networkService)
        return DictionaryViewAssembly(dependencies: dependencies)
    }
}