//
//  MainTabBarCoordinatorAssembly.swift
//  
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI

public struct MainTabBarCoordinatorAssembly {
    
    private let dependencies: ModuleDependencies
    
    public init(dependencies: ModuleDependencies) {
        self.dependencies = dependencies
    }
    
    public func assemble() -> some View {
        MainTabBarCoordinatorView(
            videoCoordinatorAssembly: dependencies.videoCoordinatorAssembly,
            trainingCoordinatorAssembly: dependencies.trainingCoordinatorAssembly,
            dictionaryCoordinatorAssembly: dependencies.dictionaryCoordinatorAssembly
        )
    }
}
