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
    private let validateEmailUseCase: ValidateEmailUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase
    private let validateUsernameUseCase: ValidateUsernameUseCase

    init(
        coordinator: SignUpCoordinator,
        validateEmailUseCase: ValidateEmailUseCase,
        validatePasswordUseCase: ValidatePasswordUseCase,
        validateUsernameUseCase: ValidateUsernameUseCase
    ) {
        self.coordinator = coordinator
        self.validateEmailUseCase = validateEmailUseCase
        self.validatePasswordUseCase = validatePasswordUseCase
        self.validateUsernameUseCase = validateUsernameUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .signUpTapped:
            signUpTapped()
        case .signInTapped:
            coordinator.showSignIn()
        case .emailChanged(let email):
            state.email = email
        case .passwordChanged(let password):
            state.password = password
        case .usernameChanged(let username):
            state.username = username
        }
    }
}

//  MARK: - Private methods

private extension SignUpViewModel {

    func validateForm() throws {
        try validateUsernameUseCase.execute(state.username)
        try validateEmailUseCase.execute(state.email)
        try validatePasswordUseCase.execute(state.password)
    }

    func signUpTapped() {
        do {
            try validateForm()
            coordinator.finish()
        } catch {
            coordinator.showError(message: error.localizedDescription)
        }
    }
}
