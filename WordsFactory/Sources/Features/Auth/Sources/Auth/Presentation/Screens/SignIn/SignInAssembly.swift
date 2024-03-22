//
//  SignInAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum SignInAssembly {

    static func assemble() -> SignInCoordinator<SignInView, SignInViewModel> {
        let viewModel = SignInViewModel()
        let view = SignInView(viewModel: viewModel)
        let coordinator = SignInCoordinator(content: view, state: viewModel)

        return coordinator
    }
}
