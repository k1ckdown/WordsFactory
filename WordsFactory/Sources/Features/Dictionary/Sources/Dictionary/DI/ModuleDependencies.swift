//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import NetworkingAPI

public struct ModuleDependencies {
    let networkService: NetworkService

    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
}
