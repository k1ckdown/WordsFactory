//
//  AuthFinishAction.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import SwiftUI

public typealias AuthFinishAction = () -> Void

struct AuthFinishActionKey: EnvironmentKey {
    static let defaultValue: AuthFinishAction? = nil
}

extension EnvironmentValues {
    var authFinish: AuthFinishAction? {
        get { self[AuthFinishActionKey.self] }
        set { self[AuthFinishActionKey.self] = newValue }
    }
}

public extension View {
    func onAuthFinish(_ action: @escaping AuthFinishAction) -> some View {
        environment(\.authFinish, action)
    }
}
