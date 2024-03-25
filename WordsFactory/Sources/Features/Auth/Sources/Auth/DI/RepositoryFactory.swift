//
//  RepositoryFactory.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

final class RepositoryFactory {

    private lazy var userRepository: UserRepositoryImpl = {
        let remoteDataSource = UserRemoteDataSource()
        return UserRepositoryImpl(remoteDataSource: remoteDataSource)
    }()

    private lazy var authRepository: AuthRepositoryImpl = {
        let repository = AuthRepositoryImpl()
        repository.delegate = userRepository
        return repository
    }()
}

// MARK: - Factory methods

extension RepositoryFactory {

    func makeAuthRepository() -> AuthRepository {
        authRepository
    }

    func makeUserRepository() -> UserRepository {
        userRepository
    }
}
