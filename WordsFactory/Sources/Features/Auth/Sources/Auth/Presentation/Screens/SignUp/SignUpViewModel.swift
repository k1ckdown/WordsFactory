//
//  SignUpViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class SignUpViewModel: ObservableObject, SignUpRouteState {

    @Published var route: SignUpRoute?
    @Published private(set) var state = ViewState()

    func handle(_ event: Event) {
        switch event {
        case .signUpTapped:
            route = .finish
        case .signInTapped:
            route = .signIn
        case .emailChanged(let email):
            state.email = email
        case .passwordChanged(let password):
            state.password = password
        case .usernameChanged(let username):
            state.username = username
        }
    }
}
