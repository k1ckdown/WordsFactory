//
//  WordRepositoryAssembly.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

import DictionaryDomain
import NetworkingAPI

public typealias UserIdProvider = () async throws -> String

public enum WordRepositoryAssembly {

    public static func assemble(
        userIdProvider: @escaping UserIdProvider,
        networkService: NetworkServiceProtocol
    ) -> WordRepositoryProtocol {
        let localDataSource = WordLocalDataSource()
        let remoteDataSource = WordRemoteDataSource(networkService: networkService)
        let repository = WordRepository(
            userIdProvider: userIdProvider,
            localDataSource: localDataSource,
            remoteDataSource: remoteDataSource
        )

        return repository
    }
}
