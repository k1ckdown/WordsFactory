//
//  LearnAnytimeViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class LearnAnytimeViewModel: ObservableObject, LearnAnytimeRouteState {

    enum Event {
        case skipTapped
        case nextTapped
    }

    @Published var route: LearnAnytimeRoute?

    func handle(_ event: Event) {
        switch event {
        case .skipTapped:
            break
        case .nextTapped:
            route = .findCourse
        }
    }
}
