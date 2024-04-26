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
    
    init(getUserUseCase: GetUserUseCase) {
        self.getUserUseCase = getUserUseCase
    }
    
    func handle(_ event: Event) {
        switch event {
        case .didLoad:
            Task { await getUser() }
        case .signOutTapped:
            break
        case .personalInfoTapped:
            break
        case .myDictionaryTapped:
            break
        }
    }
}

// MARK: Private methods

private extension ProfileViewModel {
    
    @MainActor
    func handleUser(_ user: User) {
        self.user = user
        let viewData = ViewState.ViewData(name: user.name, joinDate: "")
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
