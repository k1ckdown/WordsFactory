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

        var title: String {
            switch self {
            case .dictionary: Strings.dictionary
            case .training: Strings.training
            case .video: Strings.video
            }
        }

        var icon: Image {
            let asset = switch self {
            case .dictionary: Images.dictionaryIcon
            case .training: Images.trainingIcon
            case .video: Images.videoIcon
            }

            return asset.swiftUIImage
        }
    }
}
