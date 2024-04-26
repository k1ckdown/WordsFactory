//
//  AppFactory.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import Networking
import DictionaryData
import AuthData
import UserData
import Onboarding
import Auth
import AuthDomain
import Video
import DictionarySearch
import Training
import MainTabBar
import Profile

final class AppFactory {

    private lazy var networkService = NetworkService()
    private let authRepository: AuthRepositoryProtocol
    private lazy var userRepository = UserRepositoryAssembly.assemble()
    private lazy var wordRepository = WordRepositoryAssembly.assemble(
        userIdProvider: userRepository.getUserId,
        networkService: networkService
    )

    init(signOutHandler: (() -> Void)? = nil) {
        authRepository = AuthRepositoryAssembly.assemble(signOutHandler: signOutHandler)
    }
}

// MARK: - Coordinators

extension AppFactory {

    func makeOnboardingCoordinator(flowFinishHandler: @escaping () -> Void) -> some View {
        OnboardingCoordinatorAssembly().assemble(flowFinishHandler: flowFinishHandler)
    }

    func makeAuthCoordinator(flowFinishHandler: @escaping () -> Void) -> some View {
        let dependencies = Auth.ModuleDependencies(
            authRepository: authRepository,
            userRepository: userRepository,
            flowFinishHandler: flowFinishHandler
        )

        return AuthCoordinatorAssembly(dependencies: dependencies).assemble()
    }

    func makeMainTabBarCoordinator() -> some View {
        let dependencies = MainTabBar.ModuleDependencies(
            videoCoordinatorAssembly: makeVideoCoordinatorAssembly(),
            profileCoordinatorAssembly: makeProfileCoordinatorAssembly(),
            trainingCoordinatorAssembly: makeTrainingCoordinatorAssembly(),
            dictionaryCoordinatorAssembly: makeDictionaryCoordinatorAssembly()
        )

        return MainTabBarCoordinatorAssembly(dependencies: dependencies).assemble()
    }
}

// MARK: - Coordinator Assemblies

private extension AppFactory {

    func makeVideoCoordinatorAssembly() -> VideoCoordinatorAssembly {
        VideoCoordinatorAssembly()
    }

    func makeDictionaryCoordinatorAssembly() -> DictionaryCoordinatorAssembly {
        let dependencies = DictionarySearch.ModuleDependencies(wordRepository: wordRepository)
        return DictionaryCoordinatorAssembly(dependencies: dependencies)
    }

    func makeTrainingCoordinatorAssembly() -> TrainingCoordinatorAssembly {
        let dependencies = Training.ModuleDependencies(wordRepository: wordRepository)
        return TrainingCoordinatorAssembly(dependencies: dependencies)
    }

    func makeProfileCoordinatorAssembly() -> ProfileCoordinatorAssembly {
        let dependencies = Profile.ModuleDependencies(
            userRepository: userRepository,
            authRepository: authRepository
        )

        return ProfileCoordinatorAssembly(dependencies: dependencies)
    }
}
