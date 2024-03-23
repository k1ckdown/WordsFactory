//
//  SignInViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class SignInViewModel: ObservableObject {

    @Published private(set) var state = ViewState()

    private let coordinator: SignInCoordinator
    private let validateEmailUseCase: ValidateEmailUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase

    init(
        coordinator: SignInCoordinator,
        validateEmailUseCase: ValidateEmailUseCase,
        validatePasswordUseCase: ValidatePasswordUseCase
    ) {
        self.coordinator = coordinator
        self.validateEmailUseCase = validateEmailUseCase
        self.validatePasswordUseCase = validatePasswordUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .signInTapped:
            signInTapped()
        case .signUpTapped:
            coordinator.showSignUp()
        case .emailChanged(let email):
            state.email = email
        case .passwordChanged(let password):
            state.password = password
        }
    }
}

//  MARK: - Private methods

private extension SignInViewModel {

    func validateForm() throws {
        try validateEmailUseCase.execute(state.email)
        try validatePasswordUseCase.execute(state.password)
    }

    func signInTapped() {
        do {
            try validateForm()
            coordinator.finish()
        } catch {
            coordinator.showError(message: error.localizedDescription)
        }
    }
}
