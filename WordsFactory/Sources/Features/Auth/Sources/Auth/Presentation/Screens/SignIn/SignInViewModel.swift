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
    private let signInUseCase: SignInUseCase
    private let validateEmailUseCase: ValidateEmailUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase

    init(
        coordinator: SignInCoordinator,
        signInUseCase: SignInUseCase,
        validateEmailUseCase: ValidateEmailUseCase,
        validatePasswordUseCase: ValidatePasswordUseCase
    ) {
        self.coordinator = coordinator
        self.signInUseCase = signInUseCase
        self.validateEmailUseCase = validateEmailUseCase
        self.validatePasswordUseCase = validatePasswordUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .signInTapped:
            Task { await signInTapped() }
        case .signUpTapped:
            Task { await coordinator.showSignUp() }
        case .emailChanged(let email):
            state.email = email
        case .passwordChanged(let password):
            state.password = password
        }
    }
}

//  MARK: - Private methods

private extension SignInViewModel {

    func signIn() async throws {
        let credentials = LoginCredentials(email: state.email, password: state.password)
        try await signInUseCase.execute(credentials)
    }

    func validateForm() throws {
        try validateEmailUseCase.execute(state.email)
        try validatePasswordUseCase.execute(state.password)
    }

    func signInTapped() async {
        do {
            try validateForm()
            try await signIn()
            await coordinator.finish()
        } catch {
            await coordinator.showError(message: error.localizedDescription)
        }
    }
}
