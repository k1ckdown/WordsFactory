//
//  PersonalInfoViewModel.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import Foundation
import UserDomain

final class PersonalInfoViewModel: ObservableObject {

    @Published private(set) var state: ViewState

    private var user: User
    private let updateUserUseCase: UpdateUserUseCase
    private let coordinator: PersonalInfoCoordinatorProtocol

    init(user: User, updateUserUseCase: UpdateUserUseCase, coordinator: PersonalInfoCoordinatorProtocol) {
        self.user = user
        self.updateUserUseCase = updateUserUseCase
        self.coordinator = coordinator
        state = ViewState(name: user.name, email: user.email)
    }

    func handle(_ event: Event) {
        switch event {
        case .saveTapped:
            Task { await handleSaveTap() }
        case .nameChanged(let name):
            handleNameChange(name)
        case .emailChanged(let email):
            state.email = email
        }
    }
}

// MARK: - Private methods

private extension PersonalInfoViewModel {

    @MainActor
    func isUpdating(_ value: Bool) {
        state.isUpdating = value
    }

    func checkDataChanged() {
        state.isSaveEnabled = state.email != user.email || state.name != user.name
    }

    func handleNameChange(_ name: String) {
        state.name = name
        checkDataChanged()
    }

    func handleEmailChange(_ email: String) {
        state.email = email
        checkDataChanged()
    }

    func handleSaveTap() async {
        let userEdit = UserEdit(name: state.name, email: state.email)
        await isUpdating(true)

        do {
            try await updateUserUseCase.execute(userEdit)
        } catch {
            await MainActor.run { coordinator.showError(error.localizedDescription) }
        }
        await isUpdating(false)
    }
}
