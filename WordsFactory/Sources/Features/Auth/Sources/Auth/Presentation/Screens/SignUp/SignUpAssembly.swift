//
//  SignUpAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum SignUpAssembly {

    static func assemble() -> SignUpRouter<SignUpView, SignUpViewModel> {
        let viewModel = SignUpViewModel()
        let view = SignUpView(viewModel: viewModel)
        let router = SignUpRouter(content: view, state: viewModel)

        return router
    }
}
