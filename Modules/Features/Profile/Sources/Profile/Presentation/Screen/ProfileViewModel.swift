//
//  ProfileViewModel.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import Foundation
import UserModuleAPI

final class ProfileViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle
    private let getUserUseCase: GetUserUseCaseProtocol

    init(getUserUseCase: GetUserUseCaseProtocol) {
        self.getUserUseCase = getUserUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .didLoad:
            Task { await getUser() }
        case .saveTapped:
            break
        case .deleteAccountTapped:
            break
        case .nameChanged(let name):
            state = state.changeName(name)
        case .emailChanged(let email):
            state = state.changeEmail(email)
        }
    }
}

// MARK: Private methods

private extension ProfileViewModel {

    @MainActor
    func handleUser(_ user: User) {
        let viewData = ViewState.ViewData(name: user.name, email: user.email)
        state = .loaded(viewData)
    }

    func getUser() async {
        await MainActor.run { state = .loading }
        do {
            let user = try await getUserUseCase.execute()
            await handleUser(user)
        } catch {
            print(error)
            await MainActor.run { state = .failed }
        }
    }
}
