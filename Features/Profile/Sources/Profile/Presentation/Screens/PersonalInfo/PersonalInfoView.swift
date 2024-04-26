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

                TextField("", text: .constant(viewModel.state.email))
                    .frame(height: Constants.textFieldHeight)
                    .roundedBorderField()
                    .labeled(Strings.email)
                    .disabled(true)
            }
            .submitLabel(.return)
            .mainTextFieldStyle()
            .autocorrectionDisabled()
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, Constants.textFieldInsetTop)

            Group {
                if viewModel.state.isUpdating {
                    ProgressView().tintColor()
                } else {
                    Button(Strings.save) {
                        viewModel.handle(.saveTapped)
                    }
                    .mainButtonStyle()
                    .disabled(viewModel.state.isSaveDisabled)
                }
            }
            .padding(.bottom, Constants.saveButtonInsetBottom)
        }
        .padding(.horizontal, Constants.insetHorizontal)
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
}

// MARK: - Constants

private extension PersonalInfoView {

    enum Constants {
        static let insetHorizontal: CGFloat = 20
        static let textFieldHeight: CGFloat = 50
        static let textFieldSpacing: CGFloat = 40
        static let textFieldInsetTop: CGFloat = 50
        static let saveButtonInsetBottom: CGFloat = 55
    }
}
