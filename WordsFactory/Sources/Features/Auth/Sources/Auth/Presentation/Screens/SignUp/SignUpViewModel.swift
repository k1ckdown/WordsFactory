//
//  SignUpViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class SignUpViewModel: ObservableObject {

    @Published private(set) var state = ViewState()

    private let coordinator: SignUpCoordinator
    private let signUpUseCase: SignUpUseCase
    private let validateEmailUseCase: ValidateEmailUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase
    private let validateUsernameUseCase: ValidateUsernameUseCase

    init(
        coordinator: SignUpCoordinator,
        signUpUseCase: SignUpUseCase,
        validateEmailUseCase: ValidateEmailUseCase,
        validatePasswordUseCase: ValidatePasswordUseCase,
        validateUsernameUseCase: ValidateUsernameUseCase
    ) {
        self.coordinator = coordinator
        self.signUpUseCase = signUpUseCase
        self.validateEmailUseCase = validateEmailUseCase
        self.validatePasswordUseCase = validatePasswordUseCase
        self.validateUsernameUseCase = validateUsernameUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .signUpTapped:
            Task { await signUpTapped() }
        case .signInTapped:
            Task { await coordinator.showSignIn() }
        case .emailChanged(let email):
            state.email = email
        case .passwordChanged(let password):
            state.password = password
        case .nameChanged(let username):
            state.name = username
        }
    }
}

//  MARK: - Private methods

private extension SignUpViewModel {

    func signUp() async throws {
        let userRegister = UserRegister(name: state.name, email: state.email, password: state.password)
        try await signUpUseCase.execute(userRegister)
    }

    func validateForm() throws {
        try validateUsernameUseCase.execute(state.name)
        try validateEmailUseCase.execute(state.email)
        try validatePasswordUseCase.execute(state.password)
    }

    func signUpTapped() async {
        do {
            try validateForm()
            try await signUp()
            await coordinator.finish()
        } catch {
            await coordinator.showError(message: error.localizedDescription)
        }
    }
}
