// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WordModuleAPI",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "WordModuleAPI",
            targets: ["WordModuleAPI"]),
    ],
    targets: [
        .target(
            name: "WordModuleAPI"),
        .testTarget(
            name: "WordModuleAPITests",
            dependencies: ["WordModuleAPI"]),
    ]
)
