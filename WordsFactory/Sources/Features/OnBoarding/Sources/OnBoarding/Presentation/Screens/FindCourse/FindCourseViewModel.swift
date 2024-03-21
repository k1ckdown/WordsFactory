//
//  FindCourseViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class FindCourseViewModel: ObservableObject, FindCourseRouteState {
    
    enum Event {
        case skipTapped
        case nextTapped
    }
    
    @Published var route: FindCourseRoute?
    
    func handle(_ event: Event) {
        switch event {
        case .skipTapped:
            break
        case .nextTapped:
            route = .improveSkills
        }
    }
}
