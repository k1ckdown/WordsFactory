//
//  SignInCoordinator.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

enum SignInRoute: CaseIterable {
    case finish
    case signUp
}

protocol SignInRouteState: ObservableObject {
    var route: SignInRoute? { get set }
}

struct SignInCoordinator<Content: View, State: SignInRouteState>: View {

    private let content: Content
    @ObservedObject private var state: State
    @Environment(\.authFinish) private var authFinish

    init(content: Content, state: State) {
        self.content = content
        self.state = state
    }

    var body: some View {
        screenView
            .onChange(of: state.route) { route in
                guard case .finish = route else { return }
                authFinish?()
            }
    }

    @ViewBuilder
    private var screenView: some View {
        switch state.route {
        case .signUp:
            SignUpAssembly.assemble()
        default:
            content
        }
    }
}
