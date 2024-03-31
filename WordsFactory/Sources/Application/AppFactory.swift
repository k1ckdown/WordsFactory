//
//  AppFactory.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import Networking
import OnBoarding
import Auth
import Video
import Dictionary

final class AppFactory {
    private lazy var networkService = NetworkService()
}

// MARK: - Factory methods

extension AppFactory {

    func makeAuthCoordinator(onFlowFinish: @escaping () -> Void) -> AuthCoordinatorView {
        AuthCoordinatorAssembly().assemble(onFlowFinish: onFlowFinish)
    }

    func makeOnBoardingCoordinator(onFlowFinish: @escaping () -> Void) -> OnBoardingCoordinatorView {
        OnBoardingCoordinatorAssembly().assemble(onFlowFinish: onFlowFinish)
    }

    func makeVideoCoordinatorAssembly() -> VideoCoordinatorAssembly {
        VideoCoordinatorAssembly()
    }

    func makeDictionaryCoordinatorAssembly() -> DictionaryCoordinatorAssembly {
        let dependencies = ModuleDependencies(networkService: networkService)
        return DictionaryCoordinatorAssembly(dependencies: dependencies)
    }
}
