//
//  ProfileViewModel.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import Foundation
import UserDomain

final class ProfileViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var user: User?
    private let getUserUseCase: GetUserUseCase
    private let signOutUseCase: SignOutUseCase
    private let coordinator: ProfileCoordinatorProtocol

    init(
        getUserUseCase: GetUserUseCase,
        signOutUseCase: SignOutUseCase,
        coordinator: ProfileCoordinatorProtocol
    ) {
        self.getUserUseCase = getUserUseCase
        self.signOutUseCase = signOutUseCase
        self.coordinator = coordinator
    }

    func handle(_ event: Event) {
        switch event {
        case .onAppear:
            Task { await getUser() }
        case .signOutTapped:
            Task { await handleSignOutTap() }
        case .personalInfoTapped:
            handlePersonalInfoTap()
        case .myDictionaryTapped:
            break
        }
    }
}

// MARK: Private methods

private extension ProfileViewModel {

    func handlePersonalInfoTap() {
        guard let user else { return }
        coordinator.showPersonalInfo(with: user)
    }

    func handleSignOutTap() async {
        do {
            try await signOutUseCase.execute()
        } catch {
            await MainActor.run { coordinator.showError(message: error.localizedDescription) }
        }
    }

    @MainActor
    func handleUser(_ user: User) {
        self.user = user
        let viewData = ViewState.ViewData(
            name: user.name.capitalized,
            joinDate: user.joinDate.formatted(.dateTime.day().month().year())
        )

        state = .loaded(viewData)
    }

    func getUser() async {
        await MainActor.run { state = .loading }

        do {
            let user = try await getUserUseCase.execute()
            await handleUser(user)
        } catch {
            await MainActor.run {
                state = .failed
                coordinator.showError(message: error.localizedDescription)
            }
        }
    }
}
