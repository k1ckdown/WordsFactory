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
import WordModule
import Training
import MainTabBar

final class AppFactory {
    private lazy var networkService = NetworkService()
    private lazy var wordRepository = WordRepositoryAssembly.assemble(networkService: networkService)
}

// MARK: - Public methods

extension AppFactory {

    func makeAuthCoordinator(flowFinishHandler: @escaping () -> Void) -> some View {
        AuthCoordinatorAssembly(flowFinishHandler: flowFinishHandler).assemble()
    }

    func makeOnBoardingCoordinator(flowFinishHandler: @escaping () -> Void) -> some View {
        OnBoardingCoordinatorAssembly().assemble(flowFinishHandler: flowFinishHandler)
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

// MARK: - Private methods

private extension AppFactory {

    func makeGetDictionaryWordCountUseCase() -> GetDictionaryWordCountUseCase {
        GetDictionaryWordCountUseCase(wordRepository: wordRepository)
    }

    func makeVideoCoordinatorAssembly() -> VideoCoordinatorAssembly {
        VideoCoordinatorAssembly()
    }

    func makeDictionaryCoordinatorAssembly() -> DictionaryCoordinatorAssembly {
        let dependencies = ModuleDependencies(networkService: networkService, wordRepository: wordRepository)
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
