//
//  PersonalInfoView.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import SwiftUI
import CommonUI

struct PersonalInfoView: View {

    @StateObject private var viewModel: PersonalInfoViewModel

    init(viewModel: PersonalInfoViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            VStack(spacing: Constants.textFieldSpacing) {
                TextField("", text: name)
                    .textContentType(.name)
                    .textInputAutocapitalization(.words)
                    .frame(height: Constants.textFieldHeight)
                    .roundedBorderField()
                    .labeled(Strings.name)

                TextField("", text: email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .frame(height: Constants.textFieldHeight)
                    .roundedBorderField()
                    .labeled(Strings.email)
            }
            .submitLabel(.return)
            .mainTextFieldStyle()
            .autocorrectionDisabled()

            if viewModel.state.isUpdating {
                ProgressView().tintColor()
            } else {
                Button(Strings.save) {
                    viewModel.handle(.saveTapped)
                }
                .mainButtonStyle()
                .padding(.top, Constants.saveButtonInsetTop)
            }
        }
        .padding(.horizontal, Constants.insetHorizontal)
        .navigationTitle(Strings.personalInfo)
    }
}

// MARK: - Bindings

private extension PersonalInfoView {

    var name: Binding<String> {
        Binding(
            get: { viewModel.state.name },
            set: { viewModel.handle(.nameChanged($0)) }
        )
    }

    var email: Binding<String> {
        Binding(
            get: { viewModel.state.email },
            set: { viewModel.handle(.emailChanged($0)) }
        )
    }
}

// MARK: - Constants

private extension PersonalInfoView {

    enum Constants {
        static let insetHorizontal: CGFloat = 20
        static let textFieldHeight: CGFloat = 50
        static let textFieldSpacing: CGFloat = 40
        static let saveButtonInsetTop: CGFloat = 350
    }
}
