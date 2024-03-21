//
//  FindCourseView.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI
import CommonUI

struct FindCourseView: View {
    
    @StateObject private var viewModel: FindCourseViewModel
    
    init(viewModel: FindCourseViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        OnBoardingView(
            page: Constants.page,
            image: Images.findCourse.swiftUIImage,
            title: Strings.findCourse,
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

private extension FindCourseView {
    
    enum Constants {
        static let page = 2
    }
}
