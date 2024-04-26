//
//  MainTab.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI
import CommonUI

extension MainTabBarCoordinatorView {

    enum Tab: TabProtocol {
        case dictionary
        case training
        case video
        case profile

        var title: String {
            switch self {
            case .dictionary: Strings.dictionary
            case .training: Strings.training
            case .video: Strings.video
            case .profile: Strings.profile
            }
        }

        var icon: Image {
            switch self {
            case .dictionary: Images.dictionaryIcon.swiftUIImage
            case .training: Images.trainingIcon.swiftUIImage
            case .video: Images.videoIcon.swiftUIImage
            case .profile: Image(systemName: "person.fill")
            }
        }
    }
}
