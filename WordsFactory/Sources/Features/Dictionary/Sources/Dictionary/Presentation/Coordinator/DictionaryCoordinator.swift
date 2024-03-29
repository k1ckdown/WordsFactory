//
//  DictionaryCoordinator.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import Foundation

@MainActor
protocol DictionaryCoordinatorProtocol: AnyObject {
    func showError(message: String)
}

final class DictionaryCoordinator: ObservableObject {
    @Published var errorMessage: String?
}

// MARK: - DictionaryCoordinatorProtocol

extension DictionaryCoordinator: DictionaryCoordinatorProtocol {

    func showError(message: String) {
        errorMessage = message
    }
}
