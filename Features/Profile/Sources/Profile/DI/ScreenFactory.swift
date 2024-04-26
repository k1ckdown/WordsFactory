//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import UserDomain

final class ScreenFactory {

    private let useCaseFactory: UseCaseFactory

    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
}

// MARK: - Public methods

extension ScreenFactory {

    func makeProfileScreen(coordinator: ProfileCoordinatorProtocol) -> ProfileView {
        let viewModel = ProfileViewModel(
            getUserUseCase: useCaseFactory.makeGetUserUseCase(),
            signOutUseCase: useCaseFactory.makeSignOutUseCase(),
            coordinator: coordinator
        )

        let view = ProfileView(viewModel: viewModel)
        return view
    }

    func makePersonalInfoScreen(user: User, coordinator: PersonalInfoCoordinatorProtocol) -> PersonalInfoView {
        let viewModel = PersonalInfoViewModel(
            user: user,
            updateUserUseCase: useCaseFactory.makeUpdateUserUseCase(),
            coordinator: coordinator
        )

        let view = PersonalInfoView(viewModel: viewModel)
        return view
    }
}
