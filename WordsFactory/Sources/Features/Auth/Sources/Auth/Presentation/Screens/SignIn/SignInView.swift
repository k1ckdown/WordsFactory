//
//  SignInView.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

struct SignInView: View {

    private enum Field {
        case email, password
    }

    @FocusState private var focusedField: Field?
    @StateObject private var viewModel: SignInViewModel

    init(viewModel: SignInViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        AuthView(
            title: Strings.entrance,
            subtitle: Strings.signInAccount,
            buttonTitle: Strings.signIn,
            promptText: Strings.noAccount,
            promptTitle: Strings.signUp,
            action: {
                viewModel.handle(.signInTapped)
            },
            promptAction: {
                viewModel.handle(.signUpTapped)
            },
            content: {
                TextField(Strings.email, text: email)
                    .submitLabel(.next)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .authBorderedTextFieldStyle()
                    .focused($focusedField, equals: .email)
                    .onSubmit { focusedField = .password }

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

private extension SignInView {

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
}
