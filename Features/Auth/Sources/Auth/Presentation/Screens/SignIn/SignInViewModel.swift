//
//  SignInViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class SignInViewModel: ObservableObject {

    @Published private(set) var state = ViewState()

    private let coordinator: SignInCoordinatorProtocol
    private let signInUseCase: SignInUseCase
    private let validateEmailUseCase: ValidateEmailUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase

    init(
        coordinator: SignInCoordinatorProtocol,
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
            Task { await handleSignInTap() }
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

    @MainActor
    func isLoading(_ value: Bool) {
        state.isLoading = value
    }

    func signIn() async throws {
        let credentials = LoginCredentials(email: state.email, password: state.password)
        try await signInUseCase.execute(credentials)
    }

    func validateForm() throws {
        try validateEmailUseCase.execute(state.email)
        try validatePasswordUseCase.execute(state.password)
    }

    func handleSignInTap() async {
        do {
            try validateForm()
            await isLoading(true)
            try await signIn()
            await MainActor.run { coordinator.finish() }
        } catch {
            await MainActor.run { coordinator.showError(message: error.localizedDescription) }
        }
        await isLoading(false)
    }
}
