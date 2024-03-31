//
//  VideoCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import VideoAPI

public struct VideoCoordinatorAssembly: VideoCoordinatorAssemblyProtocol {

    public init() {}

    public func assemble() -> VideoCoordinatorView {
        VideoCoordinatorView()
    }
}
