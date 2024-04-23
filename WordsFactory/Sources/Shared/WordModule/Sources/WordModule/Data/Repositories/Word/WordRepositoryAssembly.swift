//
//  WordRepositoryAssembly.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

import WordModuleAPI
import NetworkingAPI

public enum WordRepositoryAssembly {

    public static func assemble(networkService: NetworkServiceProtocol) -> WordRepositoryProtocol {
        let localDataSource = WordLocalDataSource()
        let remoteDataSource = WordRemoteDataSource(networkService: networkService)

        let repository = WordRepository(localDataSource: localDataSource, remoteDataSource: remoteDataSource)
        return repository
    }
}
