//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import VideoAPI
import TrainingAPI
import DictionarySearchAPI

public struct ModuleDependencies {
    let videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol
    let trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol
    let dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol

    public init(
        videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol,
        trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol,
        dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol
    ) {
        self.videoCoordinatorAssembly = videoCoordinatorAssembly
        self.trainingCoordinatorAssembly = trainingCoordinatorAssembly
        self.dictionaryCoordinatorAssembly = dictionaryCoordinatorAssembly
    }
}
