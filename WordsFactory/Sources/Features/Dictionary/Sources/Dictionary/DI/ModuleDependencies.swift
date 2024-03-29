//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import NetworkingAPI

public struct ModuleDependencies {
    let networkService: NetworkServiceProtocol

    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
