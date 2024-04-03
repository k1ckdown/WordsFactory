//
//  QuestionCoordinator.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import Foundation

protocol QuestionCoordinatorProtocol: AnyObject {
    func showError(message: String)
}

final class QuestionCoordinator: ObservableObject {
    @Published var errorMessage: String?
}

extension QuestionCoordinator: QuestionCoordinatorProtocol {

    func showError(message: String) {
        errorMessage = message
    }
}
