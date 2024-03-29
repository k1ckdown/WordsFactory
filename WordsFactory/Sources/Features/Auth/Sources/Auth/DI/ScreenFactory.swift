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

// MARK: - SignInScreenFactory

extension ScreenFactory: SignInScreenFactory {

    func makeSignInScreen(coordinator: SignInCoordinatorProtocol) -> SignInView {
        let viewModel = SignInViewModel(
            coordinator: coordinator,
            signInUseCase: useCaseFactory.makeSignInUseCase(),
            validateEmailUseCase: useCaseFactory.makeValidateEmailUseCase(),
            validatePasswordUseCase: useCaseFactory.makeValidatePasswordUseCase()
        )

        let view = SignInView(viewModel: viewModel)
        return view
    }
}

// MARK: - SignUpScreenFactory

extension ScreenFactory: SignUpScreenFactory {

    func makeSignUpScreen(coordinator: SignUpCoordinator) -> SignUpView {
        let viewModel = SignUpViewModel(
            coordinator: coordinator,
            signUpUseCase: useCaseFactory.makeSignUpUseCase(),
            validateEmailUseCase: useCaseFactory.makeValidateEmailUseCase(),
            validatePasswordUseCase: useCaseFactory.makeValidatePasswordUseCase(),
            validateUsernameUseCase: useCaseFactory.makeValidateUsernameUseCase()
        )

        let view = SignUpView(viewModel: viewModel)
        return view
    }
}
