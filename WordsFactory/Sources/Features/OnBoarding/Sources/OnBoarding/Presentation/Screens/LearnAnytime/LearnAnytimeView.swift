//
//  LearnAnytimeView.swift
//
//
//  Created by Ivan Semenov on 19.03.2024.
//

import SwiftUI
import CommonUI

struct LearnAnytimeView: View {
    
    @StateObject private var viewModel: LearnAnytimeViewModel
    
    init(viewModel: LearnAnytimeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        OnBoardingView(
            page: Constants.page,
            image: Images.learnAnytime.swiftUIImage,
            title: Strings.learnAnytime,
            subtitle: Strings.quarantineIsPerfectTime,
            buttonTitle: Strings.next
        ) {
            viewModel.handle(.skipTapped)
        } continueHandler: {
            viewModel.handle(.nextTapped)
        }
    }
}

// MARK: - Constants

private extension LearnAnytimeView {
    
    enum Constants {
        static let page = 1
    }
}
