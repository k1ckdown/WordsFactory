//
//  AppFactory.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import Networking
import WordModule
import UserModule
import Onboarding
import Auth
import Video
import Dictionary
import Training
import MainTabBar

final class AppFactory {
    private lazy var networkService = NetworkService()
    private lazy var userRepository = UserRepositoryAssembly.assemble()
    private lazy var wordRepository = WordRepositoryAssembly.assemble(
        userIdProvider: userRepository.getUserId,
        networkService: networkService
    )
}

// MARK: - Coordinators

extension AppFactory {

    func makeOnboardingCoordinator(flowFinishHandler: @escaping () -> Void) -> some View {
        OnboardingCoordinatorAssembly().assemble(flowFinishHandler: flowFinishHandler)
    }

    func makeAuthCoordinator(flowFinishHandler: @escaping () -> Void) -> some View {
        let dependencies = Auth.ModuleDependencies(
            flowFinishHandler: flowFinishHandler,
            userRepository: userRepository
        )

        return AuthCoordinatorAssembly(dependencies: dependencies).assemble()
    }

    func makeMainTabBarCoordinator() -> some View {
        let dependencies = MainTabBar.ModuleDependencies(
            videoCoordinatorAssembly: makeVideoCoordinatorAssembly(),
            trainingCoordinatorAssembly: makeTrainingCoordinatorAssembly(),
            dictionaryCoordinatorAssembly: makeDictionaryCoordinatorAssembly()
        )

        return MainTabBarCoordinatorAssembly(dependencies: dependencies).assemble()
    }
}

// MARK: - Use Cases

private extension AppFactory {

    func makeGetDictionaryWordCountUseCase() -> GetDictionaryWordCountUseCase {
        GetDictionaryWordCountUseCase(wordRepository: wordRepository)
    }
}

// MARK: - Coordinator Assemblies

private extension AppFactory {

    func makeVideoCoordinatorAssembly() -> VideoCoordinatorAssembly {
        VideoCoordinatorAssembly()
    }

    func makeDictionaryCoordinatorAssembly() -> DictionaryCoordinatorAssembly {
        let dependencies = ModuleDependencies(wordRepository: wordRepository)
        return DictionaryCoordinatorAssembly(dependencies: dependencies)
    }

    func makeTrainingCoordinatorAssembly() -> TrainingCoordinatorAssembly {
        let dependencies = Training.ModuleDependencies(
            wordRepository: wordRepository,
            getDictionaryWordCountUseCase: self.makeGetDictionaryWordCountUseCase()
        )

        return TrainingCoordinatorAssembly(dependencies: dependencies)
    }
}
