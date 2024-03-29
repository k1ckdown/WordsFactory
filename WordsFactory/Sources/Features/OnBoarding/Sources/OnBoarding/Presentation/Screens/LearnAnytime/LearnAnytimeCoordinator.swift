//
//  LearnAnytimeCoordinator.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI
import CommonUI

enum LearnAnytimeRoute: CaseIterable {
    case finish
    case findCourse
}

protocol LearnAnytimeRouteState: ObservableObject {
    var route: LearnAnytimeRoute? { get set }
}

struct LearnAnytimeCoordinator<Content: View, State: LearnAnytimeRouteState>: View {

    private let content: Content
    @StateObject private var state: State
    @Environment(\.onBoardingFinish) var onBoardingFinish

    init(content: Content, state: State) {
        self.content = content
        _state = StateObject(wrappedValue: state)
    }

    var body: some View {
        RouterView(selection: $state.route, rootView: {
            content
                .navigationBarBackButtonHidden()
        }, destination: destination)
        .onChange(of: state.route) { route in
            guard case .finish = route else { return }
            onBoardingFinish()
        }
    }

    @ViewBuilder
    private func destination(_ route: LearnAnytimeRoute) -> some View {
        switch route {
        case .findCourse:
            FindCourseAssembly.assemble()
        default:
            EmptyView()
        }
    }
}
