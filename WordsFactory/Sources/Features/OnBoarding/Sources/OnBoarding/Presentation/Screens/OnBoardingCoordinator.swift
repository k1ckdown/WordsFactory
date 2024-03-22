//
//  OnBoardingCoordinator.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI

public struct OnBoardingCoordinator: View {

    public init() {}

    public var body: some View {
        NavigationView {
            LearnAnytimeAssembly.assemble()
        }
    }
}

#Preview {
    OnBoardingCoordinator()
}
