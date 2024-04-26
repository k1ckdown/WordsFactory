//
//  CoordinatorFactory.swift
//
//
//  Created by Ivan Semenov on 21.04.2024.
//

final class CoordinatorFactory {

    private let screenFactory: ScreenFactory
    private let flowFinishHandler: () -> Void

    init(screenFactory: ScreenFactory, flowFinishHandler: @escaping () -> Void) {
        self.screenFactory = screenFactory
        self.flowFinishHandler = flowFinishHandler
    }
}

// MARK: - SignInCoordinatorFactory

extension CoordinatorFactory: SignInCoordinatorFactory {
    func makeSignInCoordinator(showSignUpHandler: @escaping () -> Void) -> SignInCoordinatorView<SignInView> {
        let coordinator = SignInCoordinator(flowFinishHandler: flowFinishHandler, showSignUpHandler: showSignUpHandler)
        let coordinatorView = SignInCoordinatorView(
            content: self.screenFactory.makeSignInScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}

// MARK: - SignUpCoordinatorFactory

extension CoordinatorFactory: SignUpCoordinatorFactory {
    func makeSignUpCoordinator(showSignInHandler: @escaping () -> Void) -> SignUpCoordinatorView<SignUpView> {
        let coordinator = SignUpCoordinator(flowFinishHandler: flowFinishHandler, showSignInHandler: showSignInHandler)
        let coordinatorView = SignUpCoordinatorView(
            content: self.screenFactory.makeSignUpScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}
