//
//  SignUpRouter.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

enum SignUpRoute: CaseIterable {
    case signIn
}

protocol SignUpRouteState: ObservableObject {
    var route: SignUpRoute? { get set }
}

struct SignUpRouter<Content: View, State: SignUpRouteState>: View {

    private let content: Content
    @ObservedObject private var state: State

    init(content: Content, state: State) {
        self.content = content
        self.state = state
    }

    var body: some View {
        RouterView(selection: $state.route) {
            content
        } destination: { route in
            switch route {
            case .signIn:
                EmptyView()
            }
        }
    }
}
