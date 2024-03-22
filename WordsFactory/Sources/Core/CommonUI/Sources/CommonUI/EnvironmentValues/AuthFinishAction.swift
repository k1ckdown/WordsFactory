//
//  AuthFinishAction.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import SwiftUI

public struct AuthFinishAction {
    let action: () -> Void
    public func callAsFunction() {
        action()
    }
}

struct AuthFinishActionKey: EnvironmentKey {
    static let defaultValue: AuthFinishAction? = nil
}

public extension EnvironmentValues {
    var authFinish: AuthFinishAction? {
        get { self[AuthFinishActionKey.self] }
        set { self[AuthFinishActionKey.self] = newValue }
    }
}

extension View {
    func onAuthFinish(_ action: @escaping () -> Void) -> some View {
        environment(\.authFinish, AuthFinishAction(action: action))
    }
}
