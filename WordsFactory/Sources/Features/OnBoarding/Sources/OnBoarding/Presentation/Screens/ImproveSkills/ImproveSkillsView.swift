//
//  ImproveSkillsView.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI
import CommonUI

struct ImproveSkillsView: View {
    
    @StateObject private var viewModel: ImproveSkillsViewModel
    
    init(viewModel: ImproveSkillsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        OnBoardingView(
            page: Constants.page,
            image: Images.improveSkills.swiftUIImage,
            title: Strings.improveSkills,
            subtitle: Strings.quarantineIsPerfectTime,
            buttonTitle: Strings.letStart
        ) {
            viewModel.handle(.skipTapped)
        } continueAction: {
            viewModel.handle(.letStartTapped)
        }
    }
}

// MARK: - Constants

private extension ImproveSkillsView {
    
    enum Constants {
        static let page = 3
    }
}
