// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Video",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Video",
            targets: ["Video"]),
    ],
    dependencies: [
        .package(path: "../API/VideoAPI"),
    ],
    targets: [
        .target(
            name: "Video",
            dependencies: [
                .product(name: "VideoAPI", package: "VideoAPI")
            ]
        ),
        .testTarget(
            name: "VideoTests",
            dependencies: ["Video"]),
    ]
)
