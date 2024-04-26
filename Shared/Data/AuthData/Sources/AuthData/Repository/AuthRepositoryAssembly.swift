//
//  AuthRepositoryAssembly.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import AuthDomain

public enum AuthRepositoryAssembly {

    public static func assemble(signOutHandler: (() -> Void)? = nil) -> AuthRepositoryProtocol {
        AuthRepository(signOutHandler: signOutHandler)
    }
}
