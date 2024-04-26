//
//  UserRemoteDataSource.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import AppGroup
import UserDomain
import FirebaseAuth
import FirebaseFirestore

final class UserRemoteDataSource {

    private let database = Firestore.firestore()
    private var collection: CollectionReference {
        database.collection(Constants.userCollection)
    }
}

// MARK: - Public methods

extension UserRemoteDataSource {

    func fetchUserId() throws -> String {
        guard let userId = try Auth.auth().getStoredUser(forAccessGroup: AppGroup.Constants.appGroupId)?.uid else {
            throw AuthError.unauthorized
        }

        return userId
    }

    func fetchUser() async throws -> UserDTO {
        let userId = try fetchUserId()
        let document = try await collection.document(userId).getDocument()

        return try document.data(as: UserDTO.self)
    }
    
    func saveUser(_ user: UserDTO) async throws {
        let documentRef = collection.document(user.id)
        let data = try Firestore.Encoder().encode(user)

        try await documentRef.setData(data)
    }

    func updateUser(_ user: UserEditDTO) async throws {
        let userId = try fetchUserId()
        let documentRef = collection.document(userId)
        let data = try Firestore.Encoder().encode(user)

        try await documentRef.updateData(data)
    }
}

// MARK: - Constants

private extension UserRemoteDataSource {

    enum Constants {
        static let userCollection = "users"
    }
}
