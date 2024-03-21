//
//  FindCourseRouter.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI
import CommonUI

enum FindCourseRoute: CaseIterable {
    case improveSkills
}

protocol FindCourseRouteState: ObservableObject {
    var route: FindCourseRoute? { get set }
}

struct FindCourseRouter<Content: View, State: FindCourseRouteState>: View {

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
            case .improveSkills:
                ImproveSkillsAssembly.assemble()
            }
        }
    }
}
