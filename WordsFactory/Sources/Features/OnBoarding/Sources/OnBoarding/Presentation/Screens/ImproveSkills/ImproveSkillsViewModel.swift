//
//  ImproveSkillsViewModel.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import Foundation

final class ImproveSkillsViewModel: ObservableObject, ImproveSkillsRouteState {
    
    enum Event {
        case skipTapped
        case letStartTapped
    }
    
    @Published var route: ImproveSkillsRoute?
    
    func handle(_ event: Event) {
        switch event {
        case .skipTapped:
            break
        case .letStartTapped:
            break
        }
    }
}
