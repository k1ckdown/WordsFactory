//
//  SignInViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class SignInViewModel: ObservableObject, SignInRouteState {

    @Published var route: SignInRoute?
    @Published private(set) var state = ViewState()

    func handle(_ event: Event) {
        switch event {
        case .signInTapped:
            route = .main
        case .signUpTapped:
            route = .signUp
        case .emailChanged(let email):
            state.email = email
        case .passwordChanged(let password):
            state.password = password
        }
    }
}
