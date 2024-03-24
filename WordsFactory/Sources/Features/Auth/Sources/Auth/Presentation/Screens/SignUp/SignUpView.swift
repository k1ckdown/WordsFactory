//
//  SignUpView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

struct SignUpView: View {

    private enum Field {
        case username, email, password
    }

    @FocusState private var focusedField: Field?
    @StateObject private var viewModel: SignUpViewModel

    init(viewModel: SignUpViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        AuthView(
            title: Strings.registration,
            subtitle: Strings.createAccount,
            buttonTitle: Strings.signUp,
            promptText: Strings.haveAccount,
            promptTitle: Strings.signIn,
            action: {
                viewModel.handle(.signUpTapped)
            },
            promptAction: {
                viewModel.handle(.signInTapped)
            },
            content: {
                Group {
                    TextField(Strings.name, text: username)
                        .textContentType(.username)
                        .focused($focusedField, equals: .username)
                        .onSubmit { focusedField = .email }

                    TextField(Strings.email, text: email)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .onSubmit { focusedField = .password }
                }
                .submitLabel(.next)
                .authBorderedTextFieldStyle()

                SecureTextField(Strings.password, text: password)
                    .submitLabel(.done)
                    .textContentType(.password)
                    .focused($focusedField, equals: .password)
            }
        )
        .keyboardHideable($focusedField)
    }
}

// MARK: - Bindings

private extension SignUpView {

    var email: Binding<String> {
        Binding(
            get: { viewModel.state.email },
            set: { viewModel.handle(.emailChanged($0)) }
        )
    }
    
    var password: Binding<String> {
        Binding(
            get: { viewModel.state.password },
            set: { viewModel.handle(.passwordChanged($0)) }
        )
    }

    var username: Binding<String> {
        Binding(
            get: { viewModel.state.name },
            set: { viewModel.handle(.nameChanged($0)) }
        )
    }
}
