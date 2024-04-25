// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ProfileAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ProfileAPI",
            targets: ["ProfileAPI"]
        ),
    ],
    targets: [
        .target(
            name: "ProfileAPI"),
        .testTarget(
            name: "ProfileAPITests",
            dependencies: ["ProfileAPI"]
        ),
    ]
)
