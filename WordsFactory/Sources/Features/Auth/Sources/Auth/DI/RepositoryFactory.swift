//
//  RepositoryFactory.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

final class RepositoryFactory {

    private lazy var authRepository = AuthRepositoryImpl()
    private lazy var userRepository: UserRepositoryImpl = {
        let remoteDataSource = UserRemoteDataSource()
        return UserRepositoryImpl(remoteDataSource: remoteDataSource)
    }()
}

// MARK: - Factory methods

extension RepositoryFactory {

    func makeUserRepository() -> UserRepository {
        userRepository
    }

    func makeAuthRepository() -> AuthRepository {
        authRepository.delegate = userRepository
        return authRepository
    }
}
