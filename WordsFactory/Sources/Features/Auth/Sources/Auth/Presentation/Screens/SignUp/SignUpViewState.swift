//
//  SignUpViewState.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

extension SignUpViewModel {

    struct ViewState {
        var name = ""
        var email = ""
        var password = ""
        var isLoading = false
    }

    enum Event {
        case signUpTapped
        case signInTapped

        case nameChanged(String)
        case emailChanged(String)
        case passwordChanged(String)
    }
}
