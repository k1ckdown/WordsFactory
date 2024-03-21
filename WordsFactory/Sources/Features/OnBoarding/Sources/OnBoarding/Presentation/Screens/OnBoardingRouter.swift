//
//  OnBoardingRouter.swift
//
//
//  Created by Ivan Semenov on 20.03.2024.
//

import SwiftUI

public struct OnBoardingRouter: View {

    public init() {}

    public var body: some View {
        NavigationView {
            LearnAnytimeAssembly.assemble()
        }
    }
}

#Preview {
    OnBoardingRouter()
}
