// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VideoAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "VideoAPI",
            targets: ["VideoAPI"]
        ),
    ],
    targets: [
        .target(
            name: "VideoAPI"
        ),
        .testTarget(
            name: "VideoAPITests",
            dependencies: ["VideoAPI"]
        ),
    ]
)
