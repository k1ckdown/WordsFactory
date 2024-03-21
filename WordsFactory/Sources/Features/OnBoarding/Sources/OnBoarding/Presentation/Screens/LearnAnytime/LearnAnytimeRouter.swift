//
//  LearnAnytimeRouter.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI
import CommonUI

enum LearnAnytimeRoute: CaseIterable {
    case findCourse
}

protocol LearnAnytimeRouteState: ObservableObject {
    var route: LearnAnytimeRoute? { get set }
}

struct LearnAnytimeRouter<Content: View, State: LearnAnytimeRouteState>: View {
    
    private let content: Content
    @ObservedObject private var state: State
    
    init(content: Content, state: State) {
        self.content = content
        self.state = state
    }
    
    var body: some View {
        RouterView(selection: $state.route) {
            content
                .navigationBarBackButtonHidden()
        } destination: { route in
            switch route {
            case .findCourse:
                FindCourseAssembly.assemble()
            }
        }
    }
}
