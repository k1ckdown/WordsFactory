//
//  SignInViewState.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

extension SignInViewModel {

    struct ViewState: Equatable {
        var email = ""
        var password = ""
        var isLoading = false
    }

    enum Event {
        case signInTapped
        case signUpTapped

        case emailChanged(String)
        case passwordChanged(String)
    }
}
