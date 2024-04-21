//
//  RepositoryFactory.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

final class RepositoryFactory {

    private lazy var userRepository: UserRepository = {
        let remoteDataSource = UserRemoteDataSource()
        return UserRepository(remoteDataSource: remoteDataSource)
    }()

    private lazy var authRepository: AuthRepository = {
        let repository = AuthRepository()
        repository.delegate = userRepository
        return repository
    }()
}

// MARK: - Public methods

extension RepositoryFactory {

    func makeAuthRepository() -> AuthRepositoryProtocol {
        authRepository
    }

    func makeUserRepository() -> UserRepositoryProtocol {
        userRepository
    }
}
