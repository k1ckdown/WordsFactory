//
//  UserRepository.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import UserDomain

final class UserRepository {

    private var loadedUser: User?
    private let remoteDataSource: UserRemoteDataSource

    init(remoteDataSource: UserRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
}

// MARK: - UserRepositoryProtocol

extension UserRepository: UserRepositoryProtocol {

    func getUserId() throws -> String {
        try remoteDataSource.fetchUserId()
    }

    func saveUser(_ user: User) async throws {
        let userDto = user.toDto()
        try await remoteDataSource.saveUser(userDto)
        loadedUser = user
    }

    func updateUser(_ userEdit: UserEdit) async throws {
        guard let loadedUser else { return }

        let userEditDto = userEdit.toDto()
        try await remoteDataSource.updateUser(userEditDto)

        self.loadedUser = User(id: loadedUser.id, name: userEdit.name, email: loadedUser.email, joinDate: loadedUser.joinDate)
    }

    func getUser() async throws -> User {
        if let loadedUser, try getUserId() == loadedUser.id { return loadedUser }

        let userDto = try await remoteDataSource.fetchUser()
        let user = userDto.toDomain()

        loadedUser = user
        return user
    }
}
