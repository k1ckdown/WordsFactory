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
            dictionaryCoordinatorAssembly.assemble()
                .tag(Tab.dictionary)

            trainingCoordinatorAssembly.assemble()
                .tag(Tab.training)

            videoCoordinatorAssembly.assemble()
                .tag(Tab.video)
        }
    }
}
