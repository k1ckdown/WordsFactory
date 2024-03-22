//
//  SignUpAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum SignUpAssembly {
    
    static func assemble() -> SignUpCoordinator<SignUpView, SignUpViewModel> {
        let viewModel = SignUpViewModel()
        let view = SignUpView(viewModel: viewModel)
        let coordinator = SignUpCoordinator(content: view, state: viewModel)
        
        return coordinator
    }
}
