//
//  OnBoardingFinishAction.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

public typealias OnBoardingFinishAction = () -> Void

struct OnBoardingFinishActionKey: EnvironmentKey {
    static let defaultValue: OnBoardingFinishAction = {}
}

extension EnvironmentValues {
    var onBoardingFinish: OnBoardingFinishAction {
        get { self[OnBoardingFinishActionKey.self] }
        set { self[OnBoardingFinishActionKey.self] = newValue }
    }
}

public extension View {
    func onBoardingFinish(_ action: @escaping OnBoardingFinishAction) -> some View {
        environment(\.onBoardingFinish, action)
    }
}
