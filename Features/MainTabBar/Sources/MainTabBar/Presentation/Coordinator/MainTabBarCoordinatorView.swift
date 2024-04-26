//
//  MainTabBarCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI
import VideoAPI
import ProfileAPI
import TrainingAPI
import DictionarySearchAPI

struct MainTabBarCoordinatorView: View {
    
    @State private var selectedTab = Tab.dictionary
    
    private let videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol
    private let profileCoordinatorAssembly: ProfileCoordinatorAssemblyProtocol
    private let trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol
    private let dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol
    
    init(
        videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol,
        profileCoordinatorAssembly: ProfileCoordinatorAssemblyProtocol,
        trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol,
        dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol
    ) {
        self.videoCoordinatorAssembly = videoCoordinatorAssembly
        self.profileCoordinatorAssembly = profileCoordinatorAssembly
        self.trainingCoordinatorAssembly = trainingCoordinatorAssembly
        self.dictionaryCoordinatorAssembly = dictionaryCoordinatorAssembly
    }
    
    var body: some View {
        MainTabView(selection: $selectedTab) {
            ForEach(Tab.allCases, content: makeTabView)
        }
    }
    
    @ViewBuilder
    private func makeTabView(_ tab: Tab) -> some View {
        Group {
            switch tab {
            case .dictionary:
                dictionaryCoordinatorAssembly.assemble()
            case .training:
                trainingCoordinatorAssembly.assemble()
            case .video:
                videoCoordinatorAssembly.assemble()
            case .profile:
                profileCoordinatorAssembly.assemble()
            }
        }
        .tag(tab)
    }
}
