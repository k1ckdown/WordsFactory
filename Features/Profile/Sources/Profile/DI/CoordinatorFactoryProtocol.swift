//
//  CoordinatorFactoryProtocol.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import UserDomain

protocol PersonalInfoCoordinatorFactory {
    func makePersonalInfoCoordinator(user: User) -> PersonalInfoCoordinatorView<PersonalInfoView>
}
