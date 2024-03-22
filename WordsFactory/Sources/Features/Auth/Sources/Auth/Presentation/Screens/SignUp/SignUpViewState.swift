//
//  SignUpViewState.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

extension SignUpViewModel {

    struct ViewState {
        var email = ""
        var password = ""
        var username = ""
    }

    enum Event {
        case signUpTapped
        case signInTapped

        case emailChanged(String)
        case passwordChanged(String)
        case usernameChanged(String)
    }
}
