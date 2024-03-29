//
//  OnBoardingViewState.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

extension OnBoardingViewModel {

    struct ViewState {
        var style = OnBoardingViewStyle.learnAnytime
    }

    enum Event {
        case nextTapped
        case skipTapped
    }
}
