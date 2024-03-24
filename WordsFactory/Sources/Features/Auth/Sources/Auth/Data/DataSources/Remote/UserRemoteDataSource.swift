//
//  UserRemoteDataSource.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import FirebaseAuth
import FirebaseFirestore

final class UserRemoteDataSource {

    enum UserRemoteDataSourceError: Error {
        case unauthorized
    }

    private let database = Firestore.firestore()
    private var collection: CollectionReference {
        database.collection("users")
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
        guard let userId = Auth.auth().currentUser?.uid else {
            throw UserRemoteDataSourceError.unauthorized
        }

        let document = try await collection.document(userId).getDocument()
        return try document.data(as: UserDTO.self)
    }
}
