//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

final class ScreenFactory {
    
    private let useCaseFactory: UseCaseFactory
    
    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
}

// MARK: - Public methods

extension ScreenFactory {
    
    func makeProfileScreen(coordinator: ProfileCoordinatorProtocol) -> ProfileView {
        let viewModel = ProfileViewModel(
            getUserUseCase: useCaseFactory.makeGetUserUseCase(),
            signOutUseCase: useCaseFactory.makeSignOutUseCase(),
            coordinator: coordinator
        )
        
        let view = ProfileView(viewModel: viewModel)
        return view
    }
}
