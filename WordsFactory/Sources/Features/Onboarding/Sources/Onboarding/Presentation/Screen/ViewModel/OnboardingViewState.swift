//
//  OnboardingViewState.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

extension OnboardingViewModel {

    struct ViewState {
        var style = OnboardingViewStyle.learnAnytime
    }

    enum Event {
        case nextTapped
        case skipTapped
    }
}
