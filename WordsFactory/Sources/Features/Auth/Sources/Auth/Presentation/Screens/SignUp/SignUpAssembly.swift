//
//  SignUpAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum SignUpAssembly {

    static func assemble(showMainScene: @escaping () -> Void) -> SignUpCoordinator<SignUpView, SignUpViewModel> {
        let viewModel = SignUpViewModel()
        let view = SignUpView(viewModel: viewModel)
        let Coordinator = SignUpCoordinator(content: view, showMainScene: showMainScene, state: viewModel)

        return Coordinator
    }
}
