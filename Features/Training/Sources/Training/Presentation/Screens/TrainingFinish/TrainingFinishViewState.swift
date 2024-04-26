//
//  TrainingFinishViewState.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

extension TrainingFinishViewModel {

    enum ViewState: Equatable {
        case idle
        case loaded(ViewData)

        struct ViewData: Equatable {
            let correct: Int
            let incorrect: Int
        }
    }

    enum Event {
        case onAppear
        case againTapped
    }
}
