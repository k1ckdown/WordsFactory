//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

final class ScreenFactory {

    private let useCaseFactory: UseCaseFactory

    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
}

// MARK: - Factory methods

extension ScreenFactory {

    func makeSignIn(coordinator: SignInCoordinator) -> SignInView {
        let viewModel = SignInViewModel(
            coordinator: coordinator,
            validateEmailUseCase: useCaseFactory.makeValidateEmailUseCase(),
            validatePasswordUseCase: useCaseFactory.makeValidatePasswordUseCase()
        )

        let view = SignInView(viewModel: viewModel)
        return view
    }

    func makeSignUp(coordinator: SignUpCoordinator) -> SignUpView {
        let viewModel = SignUpViewModel(
            coordinator: coordinator,
            validateEmailUseCase: useCaseFactory.makeValidateEmailUseCase(),
            validatePasswordUseCase: useCaseFactory.makeValidatePasswordUseCase(),
            validateUsernameUseCase: useCaseFactory.makeValidateUsernameUseCase()
        )

        let view = SignUpView(viewModel: viewModel)
        return view
    }
}
