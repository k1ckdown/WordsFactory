//
//  UserRepositoryAssembly.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import UserModuleAPI

public enum UserRepositoryAssembly {

    public static func assemble() -> UserRepositoryProtocol {
        let remoteDataSource = UserRemoteDataSource()
        let repository = UserRepository(remoteDataSource: remoteDataSource)

        return repository
    }
}
