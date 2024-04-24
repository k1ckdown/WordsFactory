//
//  UserRemoteDataSource.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import AppGroup
import FirebaseAuth
import FirebaseFirestore

final class UserRemoteDataSource {

    enum UserRemoteDataSourceError: Error {
        case unauthorized
    }

    private let database = Firestore.firestore()
    private var collection: CollectionReference {
        database.collection(Constants.userCollection)
    }
}

// MARK: - Public methods

extension UserRemoteDataSource {

    func saveUser(_ user: UserDTO) async throws {
        let document = collection.document(user.id)
        let data = try Firestore.Encoder().encode(user)

        try await document.setData(data)
    }

    func fetchUser() async throws -> UserDTO {
        let userId = try fetchUserId()
        let document = try await collection.document(userId).getDocument()

        return try document.data(as: UserDTO.self)
    }

    func fetchUserId() throws -> String {
        guard let userId = try Auth.auth().getStoredUser(forAccessGroup: AppGroup.Constants.appGroupId)?.uid else {
            throw UserRemoteDataSourceError.unauthorized
        }

        return userId
    }
}

// MARK: - Constants

private extension UserRemoteDataSource {

    enum Constants {
        static let userCollection = "users"
    }
}
