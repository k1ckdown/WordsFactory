//
//  ProfileViewState.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

extension ProfileViewModel {

    enum ViewState: Equatable {
        case idle
        case failed
        case loading
        case loaded(ViewData)

        struct ViewData: Equatable {
            var name: String
            var email: String
        }
    }

    enum Event {
        case didLoad
        case saveTapped
        case deleteAccountTapped

        case nameChanged(String)
        case emailChanged(String)
    }
}

// MARK: - Mutating

extension ProfileViewModel.ViewState {

    func changeName(_ name: String) -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.name = name
        return .loaded(viewData)
    }

    func changeEmail(_ email: String) -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.email = email
        return .loaded(viewData)
    }
}
