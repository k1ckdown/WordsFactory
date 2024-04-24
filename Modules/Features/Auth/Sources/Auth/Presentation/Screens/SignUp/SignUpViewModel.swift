//
//  SignUpViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class SignUpViewModel: ObservableObject {

    @Published private(set) var state = ViewState()

    private let coordinator: SignUpCoordinatorProtocol
    private let signUpUseCase: SignUpUseCase
    private let validateEmailUseCase: ValidateEmailUseCase
    private let validatePasswordUseCase: ValidatePasswordUseCase
    private let validateUsernameUseCase: ValidateUsernameUseCase

    init(
        coordinator: SignUpCoordinatorProtocol,
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
            Task { await handleSignUpTap() }
        case .signInTapped:
            coordinator.showSignIn()
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

    @MainActor
    func isLoading(_ value: Bool) {
        state.isLoading = value
    }

    func signUp() async throws {
        let userRegister = UserRegister(name: state.name, email: state.email, password: state.password)
        try await signUpUseCase.execute(userRegister)
    }

    func validateForm() throws {
        try validateUsernameUseCase.execute(state.name)
        try validateEmailUseCase.execute(state.email)
        try validatePasswordUseCase.execute(state.password)
    }

    func handleSignUpTap() async {
        do {
            try validateForm()
            await isLoading(true)
            try await signUp()
            await MainActor.run { coordinator.finish() }
        } catch {
            await MainActor.run { coordinator.showError(message: error.localizedDescription) }
        }
        await isLoading(false)
    }
}
