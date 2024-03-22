//
//  SignInAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum SignInAssembly {

    static func assemble(showMainScene: @escaping () -> Void) -> SignInCoordinator<SignInView, SignInViewModel> {
        let viewModel = SignInViewModel()
        let view = SignInView(viewModel: viewModel)
        let Coordinator = SignInCoordinator(content: view, showMainScene: showMainScene, state: viewModel)

        return Coordinator
    }
}
