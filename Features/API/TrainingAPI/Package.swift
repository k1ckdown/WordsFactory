// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TrainingAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "TrainingAPI",
            targets: ["TrainingAPI"]
        ),
    ],
    targets: [
        .target(
            name: "TrainingAPI"
        ),
        .testTarget(
            name: "TrainingAPITests",
            dependencies: ["TrainingAPI"]
        ),
    ]
)
