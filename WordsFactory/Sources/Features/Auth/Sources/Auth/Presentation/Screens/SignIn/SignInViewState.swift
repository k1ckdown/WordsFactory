//
//  SignInViewState.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

extension SignInViewModel {

    struct ViewState {
        var email = ""
        var password = ""
    }

    enum Event {
        case signInTapped
        case signUpTapped

        case emailChanged(String)
        case passwordChanged(String)
    }
}
