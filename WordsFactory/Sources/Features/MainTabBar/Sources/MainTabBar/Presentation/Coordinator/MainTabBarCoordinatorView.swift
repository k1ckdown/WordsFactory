//
//  MainTabBarCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI
import VideoAPI
import TrainingAPI
import DictionaryAPI

struct MainTabBarCoordinatorView: View {

    @State private var selectedTab = Tab.dictionary

    private let videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol
    private let trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol
    private let dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol

    init(
        videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol,
        trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol,
        dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol
    ) {
        self.videoCoordinatorAssembly = videoCoordinatorAssembly
        self.trainingCoordinatorAssembly = trainingCoordinatorAssembly
        self.dictionaryCoordinatorAssembly = dictionaryCoordinatorAssembly
    }

    var body: some View {
        MainTabView(selection: $selectedTab) {
            ForEach(Tab.allCases) { tab in
                sceneView(tab)
            }
        }
    }

    @ViewBuilder
    private func sceneView(_ tab: Tab) -> some View {
        Group {
            switch tab {
            case .dictionary:
                dictionaryCoordinatorAssembly.assemble()
            case .training:
                trainingCoordinatorAssembly.assemble()
            case .video:
                videoCoordinatorAssembly.assemble()
            }
        }
        .tag(tab)
    }
}
