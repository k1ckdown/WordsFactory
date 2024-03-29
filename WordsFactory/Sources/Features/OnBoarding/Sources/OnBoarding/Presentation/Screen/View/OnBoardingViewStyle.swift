//
//  OnBoardingViewStyle.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import CommonUI

enum OnBoardingViewStyle: Int {
    case learnAnytime
    case findCourse
    case improveSkills
    
    var page: Int {
        rawValue
    }
    
    var subtitle: String {
        Strings.quarantineIsPerfectTime
    }
    
    var buttonTitle: String {
        switch self {
        case .improveSkills: Strings.letStart
        case .learnAnytime, .findCourse: Strings.next
        }
    }
    
    var title: String {
        switch self {
        case .learnAnytime: Strings.learnAnytime
        case .findCourse: Strings.findCourse
        case .improveSkills: Strings.improveSkills
        }
    }
    
    var image: Image {
        let asset = switch self {
        case .learnAnytime: Images.learnAnytime
        case .findCourse: Images.findCourse
        case .improveSkills: Images.improveSkills
        }
        
        return asset.swiftUIImage
    }
}
