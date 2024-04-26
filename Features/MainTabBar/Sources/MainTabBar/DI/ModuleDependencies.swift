//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import VideoAPI
import ProfileAPI
import TrainingAPI
import DictionarySearchAPI

public struct ModuleDependencies {
    let videoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol
    let profileCoordinatorAssembly: ProfileCoordinatorAssemblyProtocol
    let trainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol
    let dictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol

    public init(
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
}
