//
//  CoordinatorFactory.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import UserDomain

final class CoordinatorFactory {
    
    private let screenFactory: ScreenFactory
    
    init(screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
    }
}

// MARK: - PersonalInfoCoordinatorFactory

extension CoordinatorFactory: PersonalInfoCoordinatorFactory {
    func makePersonalInfoCoordinator(user: User) -> PersonalInfoCoordinatorView<PersonalInfoView> {
        let coordinator = PersonalInfoCoordinator()
        let coordinatorView = PersonalInfoCoordinatorView(
            content: self.screenFactory.makePersonalInfoScreen(user: user, coordinator: coordinator),
            coordinator: coordinator
        )
        
        return coordinatorView
    }
}
