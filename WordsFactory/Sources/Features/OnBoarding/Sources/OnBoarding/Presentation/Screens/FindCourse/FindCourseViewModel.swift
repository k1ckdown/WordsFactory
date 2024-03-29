//
//  FindCourseViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class FindCourseViewModel: FindCourseRouteState {

    enum Event {
        case skipTapped
        case nextTapped
    }

    @Published var route: FindCourseRoute?

    func handle(_ event: Event) {
        switch event {
        case .skipTapped:
            route = .finish
        case .nextTapped:
            route = .improveSkills
        }
    }
}
